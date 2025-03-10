#!/bin/bash
for engine in */ ; do 
    cd $engine
    source  build.sh
    cd ../
    done