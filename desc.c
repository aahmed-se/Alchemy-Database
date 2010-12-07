/*
 * This file implements AlchemyDBs DESC & DUMP commands
 *

GPL License

Copyright (c) 2010 Russell Sullivan <jaksprats AT gmail DOT com>
ALL RIGHTS RESERVED 

   This file is part of AlchemyDatabase

    AlchemyDatabase is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    AlchemyDatabase is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with AlchemyDatabase.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <errno.h>

#include "redis.h"

#include "bt.h"
#include "bt_iterator.h"
#include "index.h"
#include "alsosql.h"
#include "common.h"
#include "desc.h"

// FROM redis.c
#define RL4 redisLog(4,
extern struct sharedObjectsStruct shared;
extern struct redisServer server;

extern char    *Col_type_defs[];
extern r_tbl_t  Tbl[MAX_NUM_DB][MAX_NUM_TABLES];

// GLOBALS
int     Num_indx[MAX_NUM_DB];
r_ind_t Index   [MAX_NUM_DB][MAX_NUM_INDICES];


#define ADD_REPLY_BULK(r, buf)                \
    r = createStringObject(buf, strlen(buf)); \
    addReplyBulk(c, r);                       \
    decrRefCount(r);                          \
    card++;

void dumpCommand(redisClient *c) {
    char buf[192];
    TABLE_CHECK_OR_REPLY(c->argv[1]->ptr,)
    robj *o = lookupKeyRead(c->db, Tbl[server.dbid][tmatch].name);

    bool bdum;
    int  cmatchs[MAX_COLUMN_PER_TABLE];
    int  qcols = 0;
    parseCommaSpaceListReply(c, "*", 1, 0, 0, tmatch, cmatchs,
                             0, NULL, NULL, NULL, &qcols, &bdum);
    bt   *btr   = (bt *)o->ptr;
    char *tname = Tbl[server.dbid][tmatch].name->ptr;

    LEN_OBJ

    bool  to_mysql = 0;
    bool  ret_size = 0;
    char *m_tname  = tname;
    if (c->argc > 3) {
        if (!strcasecmp(c->argv[2]->ptr, "TO") &&
            !strcasecmp(c->argv[3]->ptr, "MYSQL")      ) {
            to_mysql = 1;
            if (c->argc > 4) m_tname = c->argv[4]->ptr;
            robj *r;
            snprintf(buf, 191, "DROP TABLE IF EXISTS `%s`;", m_tname);
            buf[191] = '\0';
            ADD_REPLY_BULK(r, buf)
            snprintf(buf, 191, "CREATE TABLE `%s` ( ", m_tname);
            buf[191] = '\0';
            r = createStringObject(buf, strlen(buf));
            for (int i = 0; i < Tbl[server.dbid][tmatch].col_count; i++) {
                bool is_int =
                         (Tbl[server.dbid][tmatch].col_type[i] == COL_TYPE_INT);
                r->ptr = sdscatprintf(r->ptr, "%s %s %s%s",
                          (i == 0) ? ""        : ",",
                          (char *)Tbl[server.dbid][tmatch].col_name[i]->ptr,
                          is_int ? "INT" : (i == 0) ? "VARCHAR(512)" : "TEXT",
                          (i == 0) ? " PRIMARY KEY" : "");
            }
            r->ptr = sdscat(r->ptr, ");");
            addReplyBulk(c, r);
            decrRefCount(r);
            card++;
            snprintf(buf, 191, "LOCK TABLES `%s` WRITE;", m_tname);
            buf[191] = '\0';
            ADD_REPLY_BULK(r, buf)
        } else if (!strcasecmp(c->argv[2]->ptr, "RETURN") &&
                   !strcasecmp(c->argv[3]->ptr, "SIZE")      ) {
            ret_size = 1;
            snprintf(buf, 191, "KEYS: %d BT-DATA: %lld BT-MALLOC: %lld",
                          btr->numkeys, btr->data_size, btr->malloc_size);
            buf[191] = '\0';
            robj *r = createStringObject(buf, strlen(buf));
            addReplyBulk(c, r);
            decrRefCount(r);
            card++;
        }
    }

    if (btr->numkeys) {
        btEntry    *be;
        btSIter *bi = btGetFullRangeIterator(o, 0, 1);
        while ((be = btRangeNext(bi, 0)) != NULL) {      // iterate btree
            robj *pko = be->key;
            robj *row = be->val;
            robj *r   = outputRow(row, qcols, cmatchs, pko, tmatch, to_mysql);
            if (!to_mysql) {
                addReplyBulk(c, r);
                decrRefCount(r);
            } else {
                snprintf(buf, 191, "INSERT INTO `%s` VALUES (", m_tname);
                buf[191] = '\0';
                robj *ins = createStringObject(buf, strlen(buf));
                ins->ptr  = sdscatlen(ins->ptr, r->ptr, sdslen(r->ptr));
                ins->ptr  = sdscatlen(ins->ptr, ");", 2);
                addReplyBulk(c, ins);
                decrRefCount(ins);
            }
            card++;
        }
        btReleaseRangeIterator(bi);
    }

    if (to_mysql) {
        robj *r;
        snprintf(buf, 191, "UNLOCK TABLES;");
        buf[191] = '\0'; /* not necessary, rule -> no sprintf's */
        ADD_REPLY_BULK(r, buf)
    }
    lenobj->ptr = sdscatprintf(sdsempty(), "*%lu\r\n", card);
}
 
ull get_sum_all_index_size_for_table(redisClient *c, int tmatch) {
    ull isize = 0;
    for (int i = 0; i < Num_indx[server.dbid]; i++) {
        if (!Index[server.dbid][i].virt &&
             Index[server.dbid][i].table == tmatch) {
            robj *ind = Index[server.dbid][i].obj;
            robj *ibt = lookupKey(c->db, ind);
            if (ibt->type != REDIS_NRL_INDEX) {
                bt *ibtr  = (bt *)(ibt->ptr);
                isize    += ibtr->malloc_size;
            }
        }
    }
    return isize;
}

static void zero_robj(robj *r) {
    r->encoding = REDIS_ENCODING_RAW;
    r->ptr      = 0;
}

void descCommand(redisClient *c) {
    char buf[256];
    TABLE_CHECK_OR_REPLY( c->argv[1]->ptr,)
    robj *o = lookupKeyRead(c->db, Tbl[server.dbid][tmatch].name);

    LEN_OBJ;
    for (int j = 0; j < Tbl[server.dbid][tmatch].col_count; j++) {
        robj *r      = createObject(REDIS_STRING, NULL);
        int   imatch = find_index(tmatch, j);
        if (imatch == -1) {
            r->ptr  = sdscatprintf(sdsempty(), "%s | %s ",
                           (char *)Tbl[server.dbid][tmatch].col_name[j]->ptr,
                           Col_type_defs[Tbl[server.dbid][tmatch].col_type[j]]);
        } else {
            robj *ind    = Index[server.dbid][imatch].obj;
            ull   isize  = 0;
            if (!Index[server.dbid][imatch].virt) {
                robj *ibt  = lookupKey(c->db, ind);
                bt   *ibtr = (bt *)(ibt->ptr);
                isize      = ibtr ? ibtr->malloc_size : 0;
            }
            r->ptr = sdscatprintf(sdsempty(),
                            "%s | %s | INDEX: %s [BYTES: %lld]",
                            (char *)Tbl[server.dbid][tmatch].col_name[j]->ptr,
                            Col_type_defs[Tbl[server.dbid][tmatch].col_type[j]],
                            (char *)ind->ptr, isize);
        }
        addReplyBulk(c, r);
        decrRefCount(r);
	card++;
    }
    /*TODO: desc info on NRL inds */

    ull  index_size = get_sum_all_index_size_for_table(c, tmatch);
    bt  *btr        = (bt *)o->ptr;
    robj minkey, maxkey;
    if (!btr->numkeys || !assignMinKey(btr, &minkey)) zero_robj(&minkey);
    if (!btr->numkeys || !assignMaxKey(btr, &maxkey)) zero_robj(&maxkey);

    if (minkey.encoding == REDIS_ENCODING_RAW) {
        if (minkey.ptr && sdslen(minkey.ptr) > 64) {
            char *x = (char *)(minkey.ptr);
            x[64] ='\0';
        }
        if (maxkey.ptr && sdslen(maxkey.ptr) > 64) {
            char *x = (char *)(maxkey.ptr);
            x[64] ='\0';
        }
        snprintf(buf, 255, "INFO: KEYS: [NUM: %d MIN: %s MAX: %s]"\
                          " BYTES: [BT-DATA: %lld BT-TOTAL: %lld INDEX: %lld]",
                btr->numkeys, (char *)minkey.ptr, (char *)maxkey.ptr,
                btr->data_size, btr->malloc_size, index_size);
        buf[255] = '\0';
    } else {
        snprintf(buf, 255, "INFO: KEYS: [NUM: %d MIN: %u MAX: %u]"\
                          " BYTES: [BT-DATA: %lld BT-TOTAL: %lld INDEX: %lld]",
            btr->numkeys, (uint32)(long)minkey.ptr, (uint32)(long)maxkey.ptr,
            btr->data_size, btr->malloc_size, index_size);
        buf[255] = '\0';
    }
    robj *r = createStringObject(buf, strlen(buf));
    addReplyBulk(c, r);
    decrRefCount(r);
    card++;
    lenobj->ptr = sdscatprintf(sdsempty(), "*%lu\r\n", card);
}

