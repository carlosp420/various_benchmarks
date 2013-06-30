#!/bin/bash

for i in {1..50}
do
    /usr/bin/time -o benchmark5.txt -a --format "\t%E real,\t%U user,\t%S sys" python benchmark5.py
done
