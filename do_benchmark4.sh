#!/bin/bash

for i in {1..50}
do
    /usr/bin/time -o benchmark4.txt -a --format "\t%E real,\t%U user,\t%S sys" python benchmark4.py
done
