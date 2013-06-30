#!/bin/bash

for i in {1..100}
do
    /usr/bin/time -o benchmark3.txt -a --format "\t%E real,\t%U user,\t%S sys" python benchmark3.py
done
