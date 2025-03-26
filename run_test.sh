#!/bin/bash

for engine in maplib jena topbraid rdf4j rdfunit dotnet_rdf pyshacl corese trav_shacl; do # $(ls -d engines/*/ | cut -f2 -d'/'); do 
    echo $engine
    mkdir ./results/$engine
    mkdir ./results/$engine/reports
    echo "Test" $engine
    docker run -d --rm --name $engine-container-test -v $(pwd)/data/test:/data -v $(pwd)/shapes/test:/shapes -v $(pwd)/results/$engine/reports:/reports  $engine-validation-experiment:latest ../data/test.ttl ../shapes/test_shapes.ttl ../reports/test_report.ttl 
done
