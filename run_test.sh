#!/bin/bash

for engine in jena; do # maplib jena topbraid rdf4j rdfunit dotnet_rdf pyshacl corese trav_shacl; do # $(ls -d engines/*/ | cut -f2 -d'/'); do 
    # mkdir -p ./results/$engine/reports/sparql/property
    mkdir -p ./results/$engine/reports/core/property

    echo "Testing" $engine "features"
    for test in ./tests/*/node/minInclusive-era-001-data.ttl; do #./tests/*/*/*-data.ttl; do
        report_dir=$(dirname $test| sed "s|./tests|results/$engine/reports|")
        test_data_path=$(echo $test| sed "s|./tests/||")
        test_shapes_path=$(echo $test_data_path| sed "s|-data||")
        filename=$(basename $test_shapes_path .ttl)
        mkdir -p $report_dir
        echo "->" $filename
        docker run --rm --name $engine-container-test-$filename -v $(pwd)/tests:/data -v $(pwd)/$report_dir:/reports  $engine-validation-experiment:latest ../data/$test_data_path ../data/$test_shapes_path ../reports/$filename-report.ttl
    done
done
