#!/bin/bash
cd data
curl -O https://zenodo.org/records/14605744/files/2025-01-05-rinf-xml-combined.nq.xz
xz -d 2025-01-05-rinf-xml-combined.nq.xz
rev 2025-01-05-rinf-xml-combined.nq | cut -d "<" -f 2- |rev |sed 's/.$/./'  > 2025-01-05-rinf-xml-combined.nt
cd ..