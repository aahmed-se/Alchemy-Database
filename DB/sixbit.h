/*
 * This file implements the sixbit compression of strings algorithms
 *

AGPL License

Copyright (c) 2011 Russell Sullivan <jaksprats AT gmail DOT com>
ALL RIGHTS RESERVED 

   This file is part of ALCHEMY_DATABASE

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __SIXBIT__H
#define __SIXBIT__H

void init_six_bit_strings();

unsigned char *createSixBit( char *src, unsigned int *new_len);
unsigned char *_createSixBit(char         *src,
                             unsigned int  src_len,
                             unsigned int *new_len);

unsigned char *unpackSixBit( unsigned char *src, unsigned int *s_len);

#endif /* __SIXBIT__H */ 
