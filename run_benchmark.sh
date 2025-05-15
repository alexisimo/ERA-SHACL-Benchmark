#!/bin/bash

for engine in maplib jena topbraid rdf4j rdfunit dotnet_rdf pyshacl corese ; do # $(ls -d engines/*/ | cut -f2 -d'/'); do
    echo $engine
    mkdir ./results/$engine
    mkdir ./results/$engine/reports

    for subset in ./data/ES.ttl ./data/FR.ttl ./data/ERA.ttl; do # #./data/*.ttl; do
        for shape in ./shapes/tds_shapes.ttl ./shapes/core_shapes.ttl /shapes/era_shapes.ttl ; do # ./shapes/*.ttl; do
            echo "loading, validation, memory_usage" > ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_results.csv ;
            for ((i=0; i<=5; i++)); do
                echo \-\> $engine "experiment" $(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl) run $i;
                docker run -d --name $engine-$(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl)-container-$i -v $(pwd)/data:/data -v $(pwd)/shapes:/shapes -v $(pwd)/results/$engine/reports:/reports  $engine-validation-experiment:latest .${subset} .${shape} ../reports/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_report.ttl 
                echo "Memory profile (GB):"
                state=$(docker inspect --format '{{.State.Running}}' $engine-$(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl)-container-$i)
                peak=$((docker stats --no-stream --format "{{.MemUsage}}") | cut -d "/" -f 1 | sed -e s_GiB_/1.024_ -e s_MiB_/1024_ -e s_KiB_/1048576_ | bc -l)
                while $state ; do
                    sample=$((docker stats --no-stream --format "{{.MemUsage}}") | cut -d "/" -f 1 | sed -e s_GiB_/1.024_ -e s_MiB_/1024_ -e s_KiB_/1048576_ | bc -l)
                    if (( $(echo "$sample > $peak" | bc -l) )); then
                        peak=$sample
                    fi
                    printf "%.3f " $sample
                    state=$(docker inspect --format '{{.State.Running}}' $engine-$(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl)-container-$i)
                done
                docker logs $engine-$(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl)-container-$i >> ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_$i.log
                loading=$(grep "Load time:" ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_$i.log | cut -d ":" -f 2)
                validation=$(grep "Validation time:" ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_$i.log | cut -d ":" -f 2)
                echo $loading","$validation", "$peak >> ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_results.csv
                rm ./results/$engine/$(basename "$subset" .ttl)_$(basename "$shape" _shapes.ttl)_$i.log 
                docker rm $engine-$(basename "$subset" .ttl)-$(basename "$shape" _shapes.ttl)-container-$i
            done
        done
    done
done
