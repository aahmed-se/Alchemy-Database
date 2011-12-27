#!/bin/bash 

CLI="./alchemy-cli"

function test_XTBL_OBYI_UUU() {
  $CLI DROP   TABLE XTBL_OBYI_UUU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UUU "(pk INT, fk INT, col INT)"
  $CLI INSERT INTO XTBL_OBYI_UUU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_UUU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_UUU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_UUU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UUU ON XTBL_OBYI_UUU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UUU WHERE "fk = 333"
}
function test_XTBL_OBYI_UUL() {
  $CLI DROP   TABLE XTBL_OBYI_UUL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UUL "(pk INT, fk INT, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_UUL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_UUL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_UUL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_UUL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UUL ON XTBL_OBYI_UUL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UUL WHERE "fk = 333"
}
function test_XTBL_OBYI_UUX() {
  $CLI DROP   TABLE XTBL_OBYI_UUX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UUX "(pk INT, fk INT, col U128)"
  $CLI INSERT INTO XTBL_OBYI_UUX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_UUX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_UUX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_UUX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UUX ON XTBL_OBYI_UUX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UUX WHERE "fk = 333"
}
function test_XTBL_OBYI_ULU() {
  $CLI DROP   TABLE XTBL_OBYI_ULU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_ULU "(pk INT, fk LONG, col INT)"
  $CLI INSERT INTO XTBL_OBYI_ULU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_ULU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_ULU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_ULU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_ULU ON XTBL_OBYI_ULU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_ULU WHERE "fk = 333"
}
function test_XTBL_OBYI_ULL() {
  $CLI DROP   TABLE XTBL_OBYI_ULL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_ULL "(pk INT, fk LONG, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_ULL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_ULL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_ULL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_ULL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_ULL ON XTBL_OBYI_ULL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_ULL WHERE "fk = 333"
}
function test_XTBL_OBYI_ULX() {
  $CLI DROP   TABLE XTBL_OBYI_ULX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_ULX "(pk INT, fk LONG, col U128)"
  $CLI INSERT INTO XTBL_OBYI_ULX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_ULX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_ULX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_ULX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_ULX ON XTBL_OBYI_ULX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_ULX WHERE "fk = 333"
}
function test_XTBL_OBYI_UXU() {
  $CLI DROP   TABLE XTBL_OBYI_UXU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UXU "(pk INT, fk U128, col INT)"
  $CLI INSERT INTO XTBL_OBYI_UXU VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_UXU VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_UXU VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_UXU VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UXU ON XTBL_OBYI_UXU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UXU WHERE "fk = 333|44"
}
function test_XTBL_OBYI_UXL() {
  $CLI DROP   TABLE XTBL_OBYI_UXL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UXL "(pk INT, fk U128, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_UXL VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_UXL VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_UXL VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_UXL VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UXL ON XTBL_OBYI_UXL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UXL WHERE "fk = 333|44"
}
function test_XTBL_OBYI_UXX() {
  $CLI DROP   TABLE XTBL_OBYI_UXX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_UXX "(pk INT, fk U128, col U128)"
  $CLI INSERT INTO XTBL_OBYI_UXX VALUES "(,333|44,55|777)"
  $CLI INSERT INTO XTBL_OBYI_UXX VALUES "(,333|44,44|777)"
  $CLI INSERT INTO XTBL_OBYI_UXX VALUES "(,333|44,11|777)"
  $CLI INSERT INTO XTBL_OBYI_UXX VALUES "(,333|44,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_UXX ON XTBL_OBYI_UXX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_UXX WHERE "fk = 333|44"
}

# LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG LONG
function test_XTBL_OBYI_LUU() {
  $CLI DROP   TABLE XTBL_OBYI_LUU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LUU "(pk LONG, fk INT, col INT)"
  $CLI INSERT INTO XTBL_OBYI_LUU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_LUU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_LUU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_LUU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LUU ON XTBL_OBYI_LUU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LUU WHERE "fk = 333"
}
function test_XTBL_OBYI_LUL() {
  $CLI DROP   TABLE XTBL_OBYI_LUL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LUL "(pk LONG, fk INT, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_LUL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_LUL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_LUL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_LUL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LUL ON XTBL_OBYI_LUL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LUL WHERE "fk = 333"
}
function test_XTBL_OBYI_LUX() {
  $CLI DROP   TABLE XTBL_OBYI_LUX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LUX "(pk LONG, fk INT, col U128)"
  $CLI INSERT INTO XTBL_OBYI_LUX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_LUX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_LUX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_LUX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LUX ON XTBL_OBYI_LUX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LUX WHERE "fk = 333"
}
function test_XTBL_OBYI_LLU() {
  $CLI DROP   TABLE XTBL_OBYI_LLU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LLU "(pk LONG, fk LONG, col INT)"
  $CLI INSERT INTO XTBL_OBYI_LLU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_LLU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_LLU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_LLU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LLU ON XTBL_OBYI_LLU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LLU WHERE "fk = 333"
}
function test_XTBL_OBYI_LLL() {
  $CLI DROP   TABLE XTBL_OBYI_LLL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LLL "(pk LONG, fk LONG, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_LLL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_LLL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_LLL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_LLL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LLL ON XTBL_OBYI_LLL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LLL WHERE "fk = 333"
}
function test_XTBL_OBYI_LLX() {
  $CLI DROP   TABLE XTBL_OBYI_LLX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LLX "(pk LONG, fk LONG, col U128)"
  $CLI INSERT INTO XTBL_OBYI_LLX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_LLX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_LLX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_LLX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LLX ON XTBL_OBYI_LLX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LLX WHERE "fk = 333"
}
function test_XTBL_OBYI_LXU() {
  $CLI DROP   TABLE XTBL_OBYI_LXU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LXU "(pk LONG, fk U128, col INT)"
  $CLI INSERT INTO XTBL_OBYI_LXU VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_LXU VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_LXU VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_LXU VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LXU ON XTBL_OBYI_LXU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LXU WHERE "fk = 333|44"
}
function test_XTBL_OBYI_LXL() {
  $CLI DROP   TABLE XTBL_OBYI_LXL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LXL "(pk LONG, fk U128, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_LXL VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_LXL VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_LXL VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_LXL VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LXL ON XTBL_OBYI_LXL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LXL WHERE "fk = 333|44"
}
function test_XTBL_OBYI_LXX() {
  $CLI DROP   TABLE XTBL_OBYI_LXX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_LXX "(pk LONG, fk U128, col u128)"
  $CLI INSERT INTO XTBL_OBYI_LXX VALUES "(,333|44,55|777)"
  $CLI INSERT INTO XTBL_OBYI_LXX VALUES "(,333|44,44|777)"
  $CLI INSERT INTO XTBL_OBYI_LXX VALUES "(,333|44,11|777)"
  $CLI INSERT INTO XTBL_OBYI_LXX VALUES "(,333|44,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_LXX ON XTBL_OBYI_LXX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_LXX WHERE "fk = 333|44"
}

# U128 U128 U128 U128 U128 U128 U128 U128 U128 U128 U128 U128 U128 U128 U128
function test_XTBL_OBYI_XUU() {
  $CLI DROP   TABLE XTBL_OBYI_XUU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XUU "(pk U128, fk INT, col INT)"
  $CLI INSERT INTO XTBL_OBYI_XUU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_XUU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_XUU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_XUU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XUU ON XTBL_OBYI_XUU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XUU WHERE "fk = 333"
}
function test_XTBL_OBYI_XUL() {
  $CLI DROP   TABLE XTBL_OBYI_XUL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XUL "(pk U128, fk INT, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_XUL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_XUL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_XUL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_XUL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XUL ON XTBL_OBYI_XUL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XUL WHERE "fk = 333"
}
function test_XTBL_OBYI_XUX() {
  $CLI DROP   TABLE XTBL_OBYI_XUX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XUX "(pk U128, fk INT, col U128)"
  $CLI INSERT INTO XTBL_OBYI_XUX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_XUX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_XUX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_XUX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XUX ON XTBL_OBYI_XUX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XUX WHERE "fk = 333"
}
function test_XTBL_OBYI_XLU() {
  $CLI DROP   TABLE XTBL_OBYI_XLU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XLU "(pk U128, fk LONG, col INT )"
  $CLI INSERT INTO XTBL_OBYI_XLU VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_XLU VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_XLU VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_XLU VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XLU ON XTBL_OBYI_XLU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XLU WHERE "fk = 333"
}
function test_XTBL_OBYI_XLL() {
  $CLI DROP   TABLE XTBL_OBYI_XLL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XLL "(pk U128, fk LONG, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_XLL VALUES "(,333,55)"
  $CLI INSERT INTO XTBL_OBYI_XLL VALUES "(,333,44)"
  $CLI INSERT INTO XTBL_OBYI_XLL VALUES "(,333,11)"
  $CLI INSERT INTO XTBL_OBYI_XLL VALUES "(,333,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XLL ON XTBL_OBYI_XLL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XLL WHERE "fk = 333"
}
function test_XTBL_OBYI_XLX() {
  $CLI DROP   TABLE XTBL_OBYI_XLX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XLX "(pk U128, fk LONG, col U128)"
  $CLI INSERT INTO XTBL_OBYI_XLX VALUES "(,333,55|777)"
  $CLI INSERT INTO XTBL_OBYI_XLX VALUES "(,333,44|777)"
  $CLI INSERT INTO XTBL_OBYI_XLX VALUES "(,333,11|777)"
  $CLI INSERT INTO XTBL_OBYI_XLX VALUES "(,333,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XLX ON XTBL_OBYI_XLX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XLX WHERE "fk = 333"
}
function test_XTBL_OBYI_XXU() {
  $CLI DROP   TABLE XTBL_OBYI_XXU >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XXU "(pk U128, fk U128, col INT)"
  $CLI INSERT INTO XTBL_OBYI_XXU VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_XXU VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_XXU VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_XXU VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XXU ON XTBL_OBYI_XXU "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XXU WHERE "fk = 333|44"
}
function test_XTBL_OBYI_XXL() {
  $CLI DROP   TABLE XTBL_OBYI_XXL >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XXL "(pk U128, fk U128, col LONG)"
  $CLI INSERT INTO XTBL_OBYI_XXL VALUES "(,333|44,55)"
  $CLI INSERT INTO XTBL_OBYI_XXL VALUES "(,333|44,44)"
  $CLI INSERT INTO XTBL_OBYI_XXL VALUES "(,333|44,11)"
  $CLI INSERT INTO XTBL_OBYI_XXL VALUES "(,333|44,22)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XXL ON XTBL_OBYI_XXL "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XXL WHERE "fk = 333|44"
}
function test_XTBL_OBYI_XXX() {
  $CLI DROP   TABLE XTBL_OBYI_XXX >/dev/null
  $CLI CREATE TABLE XTBL_OBYI_XXX "(pk U128, fk U128, col U128)"
  $CLI INSERT INTO XTBL_OBYI_XXX VALUES "(,333|44,55|777)"
  $CLI INSERT INTO XTBL_OBYI_XXX VALUES "(,333|44,44|777)"
  $CLI INSERT INTO XTBL_OBYI_XXX VALUES "(,333|44,11|777)"
  $CLI INSERT INTO XTBL_OBYI_XXX VALUES "(,333|44,22|777)"
  $CLI CREATE INDEX iob_XTBL_OBYI_XXX ON XTBL_OBYI_XXX "(fk)" ORDER BY col
  $CLI SELECT \* FROM XTBL_OBYI_XXX WHERE "fk = 333|44"
}

function test_XTBL_OBYI_ALL() {
  test_XTBL_OBYI_UUU; test_XTBL_OBYI_UUL; test_XTBL_OBYI_UUX;
  test_XTBL_OBYI_ULU; test_XTBL_OBYI_ULL; test_XTBL_OBYI_ULX;
  test_XTBL_OBYI_UXU; test_XTBL_OBYI_UXL; test_XTBL_OBYI_UXX;
  test_XTBL_OBYI_LUU; test_XTBL_OBYI_LUL; test_XTBL_OBYI_LUX;
  test_XTBL_OBYI_LLU; test_XTBL_OBYI_LLL; test_XTBL_OBYI_LLX;
  test_XTBL_OBYI_LXU; test_XTBL_OBYI_LXL; test_XTBL_OBYI_LXX;
  test_XTBL_OBYI_XUU; test_XTBL_OBYI_XUL; test_XTBL_OBYI_XUX;
  test_XTBL_OBYI_XLU; test_XTBL_OBYI_XLL; test_XTBL_OBYI_XLX;
  test_XTBL_OBYI_XXU; test_XTBL_OBYI_XXL; test_XTBL_OBYI_XXX;
}

# UNIQ_MCI_X UNIQ_MCI_X UNIQ_MCI_X UNIQ_MCI_X UNIQ_MCI_X UNIQ_MCI_X UNIQ_MCI_X
function test_XTBL_uUUX() {
  $CLI DROP   TABLE XTBL_uUUX >/dev/null
  $CLI CREATE TABLE XTBL_uUUX "(pk INT , fk INT , col U128)"
  $CLI INSERT INTO XTBL_uUUX VALUES "(,333,55|771)"
  $CLI INSERT INTO XTBL_uUUX VALUES "(,333,44|772)"
  $CLI INSERT INTO XTBL_uUUX VALUES "(,333,11|773)"
  $CLI INSERT INTO XTBL_uUUX VALUES "(,333,22|774)"
  $CLI CREATE UNIQUE INDEX iob_XTBL_uUUX ON XTBL_uUUX "(fk,col)"
  $CLI SELECT \* FROM XTBL_uUUX WHERE "fk = 333 AND col = 44|772"
}
function test_XTBL_uLUX() {
  $CLI DROP   TABLE XTBL_uLUX >/dev/null
  $CLI CREATE TABLE XTBL_uLUX "(pk LONG, fk INT , col U128)"
  $CLI INSERT INTO XTBL_uLUX VALUES "(,333,55|771)"
  $CLI INSERT INTO XTBL_uLUX VALUES "(,333,44|772)"
  $CLI INSERT INTO XTBL_uLUX VALUES "(,333,11|773)"
  $CLI INSERT INTO XTBL_uLUX VALUES "(,333,22|774)"
  $CLI CREATE UNIQUE INDEX iob_XTBL_uLUX ON XTBL_uLUX "(fk,col)"
  $CLI SELECT \* FROM XTBL_uLUX WHERE "fk = 333 AND col = 44|772"
}
function test_XTBL_uXXU() {
  $CLI DROP   TABLE XTBL_uXXU >/dev/null
  $CLI CREATE TABLE XTBL_uXXU "(pk U128, fk U128, col INT )"
  $CLI INSERT INTO XTBL_uXXU VALUES "(,333|44,1)"
  $CLI INSERT INTO XTBL_uXXU VALUES "(,333|44,2)"
  $CLI INSERT INTO XTBL_uXXU VALUES "(,333|44,3)"
  $CLI INSERT INTO XTBL_uXXU VALUES "(,333|44,4)"
  $CLI CREATE UNIQUE INDEX iob_XTBL_uXXU ON XTBL_uXXU "(fk,col)"
  $CLI SELECT \* FROM XTBL_uXXU WHERE "fk = 333|44 AND col = 2"
}
function test_XTBL_uXXL() {
  $CLI DROP   TABLE XTBL_uXXL >/dev/null
  $CLI CREATE TABLE XTBL_uXXL "(pk U128, fk U128, col LONG)"
  $CLI INSERT INTO XTBL_uXXL VALUES "(,333|44,1)"
  $CLI INSERT INTO XTBL_uXXL VALUES "(,333|44,2)"
  $CLI INSERT INTO XTBL_uXXL VALUES "(,333|44,3)"
  $CLI INSERT INTO XTBL_uXXL VALUES "(,333|44,4)"
  $CLI CREATE UNIQUE INDEX iob_XTBL_uXXL ON XTBL_uXXL "(fk,col)"
  $CLI SELECT \* FROM XTBL_uXXL WHERE "fk = 333|44 AND col = 2"
}
function test_XTBL_uXXX() {
  $CLI DROP   TABLE XTBL_uXXX >/dev/null
  $CLI CREATE TABLE XTBL_uXXX "(pk U128, fk U128, col U128)"
  $CLI INSERT INTO XTBL_uXXX VALUES "(,333|44,55|771)"
  $CLI INSERT INTO XTBL_uXXX VALUES "(,333|44,44|772)"
  $CLI INSERT INTO XTBL_uXXX VALUES "(,333|44,11|773)"
  $CLI INSERT INTO XTBL_uXXX VALUES "(,333|44,22|774)"
  $CLI CREATE UNIQUE INDEX iob_XTBL_uXXX ON XTBL_uXXX "(fk,col)"
  $CLI SELECT \* FROM XTBL_uXXX WHERE "fk = 333|44 AND col = 44|772"
}
function test_XTBL_u_ALL() {
  test_XTBL_uUUX; test_XTBL_uLUX; test_XTBL_uXXU
  test_XTBL_uXXL; test_XTBL_uXXX;
}

# MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI MCI
function test_XTBL_mci_XXXX() {
  $CLI DROP   TABLE XTBL_mci_XXXX >/dev/null
  $CLI CREATE TABLE XTBL_mci_XXXX "(pk U128, fk U128, col U128, c2 U128)"
  $CLI INSERT INTO XTBL_mci_XXXX VALUES "(,333|44,55|777,222|222)"
  $CLI INSERT INTO XTBL_mci_XXXX VALUES "(,333|44,55|777,111|111)"
  $CLI INSERT INTO XTBL_mci_XXXX VALUES "(,333|44,11|888,111|111)"
  $CLI INSERT INTO XTBL_mci_XXXX VALUES "(,333|44,11|888,222|222)"
  $CLI CREATE INDEX iob_XTBL_mci_XXXX ON XTBL_mci_XXXX "(fk,col)"
  $CLI SELECT \* FROM XTBL_mci_XXXX WHERE "fk = 333|44 AND col = 55|777"
}

function test_OBY_ALL() {
  test_XTBL_OBYI_ALL; test_XTBL_u_ALL; test_XTBL_mci_XXXX
}