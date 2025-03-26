#!/bin/bash
python validate.py $1 $2 $(dirname $3)
mv ../reports/validationReport.ttl ../reports/$(basename "$1" .ttl)_report.ttl
