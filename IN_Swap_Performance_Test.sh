#!/bin/bash

echo ./alsosql-cli CREATE TABLE bigrow \(id int primary key, field TEXT\)
./alsosql-cli CREATE TABLE bigrow \(id int primary key, field TEXT\)

# INSERT INSERT INSERT INSERT INSERT INSERT INSERT  INSERT INSERT INSERT
# INSERT INSERT INSERT INSERT INSERT INSERT INSERT  INSERT INSERT INSERT
PNUM=20000000
DUMP=100000

echo taskset -c 1 ./alsosql-benchmark -n $PNUM -r $PNUM -B -X $DUMP
taskset -c 1 ./alsosql-benchmark -n $PNUM -r $PNUM -B -X $DUMP
echo ./alsosql-cli DESC bigrow
./alsosql-cli DESC bigrow
echo free -m
free -m

echo taskset -c 1 ./alsosql-benchmark -n $PNUM -r $PNUM -B -X $DUMP -NR $PNUM
taskset -c 1 ./alsosql-benchmark -n $PNUM -r $PNUM -B -X $DUMP -NR $PNUM
echo ./alsosql-cli DESC bigrow
./alsosql-cli DESC bigrow
echo free -m
free -m

# SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT 
# SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT SELECT 
REQ_NUM=50000000
RANGE_NUM=20000000
DUMP=5000

echo taskset -c 1 ./alsosql-benchmark -n $REQ_NUM -r $RANGE_NUM -BS -RF -X $DUMP
taskset -c 1 ./alsosql-benchmark -n $REQ_NUM -r $RANGE_NUM -BS -RF -X $DUMP
