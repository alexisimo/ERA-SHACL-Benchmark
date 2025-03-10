#!/bin/bash
for filename in ../data/*.ttl; do
    echo "loading, validation" > ../results/$(basename "$filename" .ttl)_results.csv ;
    for ((i=0; i<=3; i++)); do
        python validate.py ${filename} ../shapes/test/ ../reports/$(basename "$filename" .ttl)_report >> ../results/$(basename "$filename" .ttl)_result.log
        cp ../reports/$(basename "$filename" .ttl)_report/validationReport.ttl ../reports/$(basename "$filename" .ttl)_report.ttl
        rm -r ../reports/$(basename "$filename" .ttl)_report/
        LOADING=$(grep "Estimated load time:" ../results/$(basename "$filename" .ttl)_result.log | cut -d ":" -f 2)
        VALIDATION=$(grep "Estimated validation time:" ../results/$(basename "$filename" .ttl)_result.log | cut -d ":" -f 2)
        echo $LOADING","$VALIDATION >> ../results/$(basename "$filename" .ttl)_results.csv
        rm ../results/$(basename "$filename" .ttl)_result.log 
    done
done