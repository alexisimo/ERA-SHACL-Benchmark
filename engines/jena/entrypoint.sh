#!/bin/bash
mvn clean install exec:java -Dexec.mainClass=oeg.shacl.validator.Validator -Dexec.args="$*"
