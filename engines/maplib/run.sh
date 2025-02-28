#!/bin/bash
for filename in ../data/*.ttl; do

    for ((i=0; i<=3; i++)); do
        python validate.py ../data/${filename} ../shapes/$(basename "$filename" .ttl)_shapes.ttl ../reports/$(basename "$filename" .ttl)_report_$i.ttl >> ../results/$(basename "$filename" .ttl)_result_$i.log
    done
done