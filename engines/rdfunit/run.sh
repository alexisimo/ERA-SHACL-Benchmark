#!/bin/bash
export JAVA_PROGRAM_ARGS=`echo "$@"`
mvn exec:java -X -Dexec.mainClass="oeg.shacl.validator.Validator" -Dexec.args="$JAVA_PROGRAM_ARGS"