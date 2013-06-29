#!/bin/bash

for i in {1..100}
do
    /usr/bin/time -o benchmark1.txt -a --format "\t%E real,\t%U user,\t%S sys" python benchmark1.py
done
