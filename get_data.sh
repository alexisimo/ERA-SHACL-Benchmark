#!/bin/bash
# Get datadump and convert to ntriples
mkdir data/raw
cd data/raw
echo "Downloading the compressed knowledge graph assertions from the repository..."
curl -O https://zenodo.org/records/14605744/files/2025-01-05-rinf-xml-combined.nq.xz
echo "Uncompressing file into nquads..."
xz -d 2025-01-05-rinf-xml-combined.nq.xz
echo "Converting from nquads to ntriples... (this process takes a couple minutes)"
rev 2025-01-05-rinf-xml-combined.nq | cut -d "<" -f 2- |rev |sed 's/.$/./'  > 2025-01-05-rinf-xml-combined.nt
rm 2025-01-05-rinf-xml-combined.nq
cd ../..

# Get vocabularies
mkdir data/vocabularies
cd data/vocabularies
echo "Downloading the knoledge graph vocabularies and ontology..."
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-AxleBearingMonitoring.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-BrakeParkingType.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-Categories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-CompanyCodeCategories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-CompliantPantographHeads.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ContactLineSystems.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ContactStripMaterials.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-EddyCurrentBraking.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-EndCouplingType.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-EnergySupplySystems.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSBaselines.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSEquipmentLevels.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSInfills.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSLevels.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSMVersions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSSituations.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ETCSSystemCompatibilities.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-FreightCorridors.ttl
# curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-FrenchTrainDetectionSystemLimitations.ttl # Deprecated
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-FrenchTrainDetectionSystemLimitationNumbers.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GaugeChangeoverFacilities.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GaugingProfiles.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GSMREquipmentVersion.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GSMRNetworks.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GSMRRadioDataCommunications.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-GSMRVersions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-HotAxleBoxDetectorDirections.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-IceConditions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-LegacyRadioSystems.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-LineCategories.ttl
# curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-LoadCapabilities.ttl # Deprecated
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-LoadCapabilityLineCategories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-MagneticBraking.ttl
# curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-MaxAmountSandings.ttl # Deprecated
# curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-MinAxleLoadsPerVehicleCategory.ttl # Deprecated
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-MinAxleLoadVehicleCategories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-Navigabilities.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-NominalTrackGauges.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-NumberActiveMobiles.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-OperationalPointTypes.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-OptionalFunctions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-OSMClasses.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-OtherPantographHeads.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-OtherProtectionControlWarnings.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-PlatformHeights.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ProfileNumbersSemiTrailers.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ProfileNumbersSwapBodies.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-RadioSystemCompatibilitiesData.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-RadioSystemCompatibilitiesVoice.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-RailInclinations.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-RelationPositions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-Restrictions.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-RollingStockFireCategories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-SoLNatures.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-States.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-SubCategories.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TemperatureRanges.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TENClassifications.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-ThermalCapacityTSIReferences.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TrackRunningDirections.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TrainDetectionSystems.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TrainDetectionSystemsSpecificChecks.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TrainProtectionLegacySystems.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TSICompliances.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TSIExistenceAndCompliances.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/skos/era-skos-TypeVersionIds.ttl
curl -O https://data-interop.era.europa.eu/era-vocabulary/ontology.ttl
cd ../..

# Subsets
echo "Subsetting and concatenating with the vocabularies into the benchmark knowledge graph subsets..."
sed -n 33538045,34761236p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/ES.nt
sed -n 35092900,46412047p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/FR.nt
sed -n 50188479,50215374p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/LV.nt

# Create a single file for the knowledge graph subsets
for f in data/vocabularies/*.ttl; do (cat "${f}"; echo) >> data/vocabularies/vocabularies.ttl; done
cat data/vocabularies/vocabularies.ttl data/raw/2025-01-05-rinf-xml-combined.nt > data/ERA.ttl
cat data/vocabularies/vocabularies.ttl data/raw/ES.nt > data/ES.ttl
cat data/vocabularies/vocabularies.ttl data/raw/FR.nt > data/FR.ttl
# cat data/vocabularies/vocabularies.ttl data/raw/LV.nt > data/LV.ttl

# Get shapes
mkdir shapes
cd shapes
echo "Downloading the full set of SHACL shapes..."
curl -o era_shapes.ttl https://data-interop.era.europa.eu/era-vocabulary/era-shapes
cd ..

# Subset shapes for SHACL core only # remove REGEX era-sh:.*sparql((.|\n)+?""" .$)
echo "Subsetting SHACL shapes into core and train detection systems..."
sed '/era-sh:.*sparql/,/.*""".*.$/d' shapes/era_shapes.ttl > shapes/core_shapes.ttl
# Subset shapes for train detection systems
sed -n 4381,4796p shapes/era_shapes.ttl > shapes/tds_shapes.ttl

# Create test subsets
echo "Getting maxCount-era-002 test resources..."
echo "# maxCount-era-002 valid resource" > tests/core/property/maxCount-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/trainDetectionSystems/ESL400400010_ES51101_II_ES51111_track%20circuit>" data/ERA.ttl >> tests/core/property/maxCount-era-002-data.ttl
echo "# maxCount-era-002 invalid resource" >> tests/core/property/maxCount-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/trainDetectionSystems/ESL512007300_ES42020_U_ES43023_wheel%20detector>" data/ERA.ttl >> tests/core/property/maxCount-era-002-data.ttl

echo "Getting class-era-001, class-era-002 test resources..."
echo "# class-era-001 valid resource" > tests/core/property/class-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/operationalPoints/0b940a5320dee6993ae2e90f88538465f0f3c0bc>" data/ERA.ttl >> tests/core/property/class-era-001-data.ttl
grep "<http://data.europa.eu/949/documents/b4e2b5340d9c2086affeabbf1f6f427f0112ccdd>" data/ERA.ttl >> tests/core/property/class-era-001-data.ttl
echo "# class-era-001 invalid resource" >> tests/core/property/class-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/operationalPoints/a7a2ce92523c7c250b0bb25a6e7a2a31b82acc8c>" data/ERA.ttl >> tests/core/property/class-era-001-data.ttl
grep "<http://data.europa.eu/949/documents/0b03113a9f7af9051ee710609f82ee65a1421bbe>" data/ERA.ttl >> tests/core/property/class-era-001-data.ttl
cp tests/core/property/class-era-001-data.ttl tests/core/property/class-era-002-data.ttl
cp tests/core/property/class-era-001-data.ttl tests/core/node/class-era-002-data.ttl
cat data/vocabularies/ontology.ttl > tests/core/node/class-era-001-data.ttl
cat tests/core/property/class-era-001-data.ttl >> tests/core/node/class-era-001-data.ttl


echo "Getting path-sequence-era-001 test resources..."
echo "# path-sequence-era-001 valid resource" > tests/core/path/path-sequence-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/21ffaaa0f33d609cbd6f672df6f3f34927b90047>" data/ERA.ttl >> tests/core/path/path-sequence-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/Vilnius-Kena-BY_LTKena_II_EU00250_distancetypeMAXlength270switchoffbreakerYlowerpantographNchangesupplysystemNkm034.780>" data/ERA.ttl >> tests/core/path/path-sequence-era-001-data.ttl
echo "# path-sequence-era-001 invalid resource" >> tests/core/path/path-sequence-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/36bf1461f295d432dd780fdc507133f908b7a1d4>" data/ERA.ttl >> tests/core/path/path-sequence-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/ESL984610276_ESA0849_II%20MIXTA_ES08207_length402switchoffbreakerYlowerpantographN>" data/ERA.ttl >> tests/core/path/path-sequence-era-001-data.ttl

echo "Getting datatype-era-002 test resources..."
echo "# datatype-era-002 valid resource" > tests/core/property/datatype-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/21ffaaa0f33d609cbd6f672df6f3f34927b90047>" data/ERA.ttl >> tests/core/property/datatype-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/Vilnius-Kena-BY_LTKena_II_EU00250_distancetypeMAXlength270switchoffbreakerYlowerpantographNchangesupplysystemNkm034.780>" data/ERA.ttl >> tests/core/property/datatype-era-002-data.ttl
echo "# datatype-era-002 invalid resource" >> tests/core/property/datatype-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/36bf1461f295d432dd780fdc507133f908b7a1d4>" data/ERA.ttl >> tests/core/property/datatype-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/ESL984610276_ESA0849_II%20MIXTA_ES08207_length402switchoffbreakerYlowerpantographN>" data/ERA.ttl >> tests/core/property/datatype-era-002-data.ttl
cp tests/core/property/datatype-era-002-data.ttl tests/core/node/datatype-era-001-data.ttl

echo "Getting or-era-001 test resources..."
echo "# or-era-001 valid resource" > tests/core/property/or-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/21ffaaa0f33d609cbd6f672df6f3f34927b90047>" data/ERA.ttl >> tests/core/property/or-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/Vilnius-Kena-BY_LTKena_II_EU00250_distancetypeMAXlength270switchoffbreakerYlowerpantographNchangesupplysystemNkm034.780>" data/ERA.ttl >> tests/core/property/or-era-001-data.ttl
echo "# or-era-001 invalid resource" >> tests/core/property/or-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/36bf1461f295d432dd780fdc507133f908b7a1d4>" data/ERA.ttl >> tests/core/property/or-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/ESL984610276_ESA0849_II%20MIXTA_ES08207_length402switchoffbreakerYlowerpantographN>" data/ERA.ttl >> tests/core/property/or-era-001-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/property/or-era-002-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/node/or-era-001-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/node/or-era-002-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/node/hasValue-era-001-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/property/hasValue-era-001-data.ttl

echo "Getting pattern-era-001 test resources..."
echo "# pattern-era-001 valid resource" > tests/core/property/pattern-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/sidings/03f5ac96ec17387fef12b06e302b74893b4ec932>" data/ERA.ttl >> tests/core/property/pattern-era-001-data.ttl
echo "# pattern-era-001 invalid resource" >> tests/core/property/pattern-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/sidings/41f97688067c71186b284ba9c7b85c1e259167df>" data/ERA.ttl >> tests/core/property/pattern-era-001-data.ttl
cp tests/core/property/pattern-era-001-data.ttl tests/core/node/pattern-era-001-data.ttl

echo "Getting maxExclusive-era-001 test resources..."
echo "# maxExclusive-era-001 valid resource" > tests/core/property/maxExclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B5.0966/52.0988>" data/ERA.ttl >> tests/core/property/maxExclusive-era-001-data.ttl
echo "# maxExclusive-era-001 invalid resource" >> tests/core/property/maxExclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B49.2266/16.6055>" data/ERA.ttl >> tests/core/property/maxExclusive-era-001-data.ttl
cp tests/core/property/maxExclusive-era-001-data.ttl tests/core/node/maxExclusive-era-001-data.ttl

echo "Getting minInclusive-era-001 test resources..."
echo "# minInclusive-era-001 invalid resource" > tests/core/property/minInclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B49.2266/16.6055>" data/ERA.ttl >> tests/core/property/minInclusive-era-001-data.ttl
echo "# minInclusive-era-001 valid resource" >> tests/core/property/minInclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B5.0966/52.0988>" data/ERA.ttl >> tests/core/property/minInclusive-era-001-data.ttl
cp tests/core/property/minInclusive-era-001-data.ttl tests/core/node/minInclusive-era-001-data.ttl

echo "Getting sparql-era-001 test resources..."
echo "# ontology and train protection legacy systems skos concepts" > tests/sparql/property/sparql-era-001-data.ttl
cat data/vocabularies/ontology.ttl data/vocabularies/era-skos-TrainProtectionLegacySystems.ttl >> tests/sparql/property/sparql-era-001-data.ttl
echo "# sparql-era-001 valid resource" >> tests/sparql/property/sparql-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/07946c41d18b51d16a9fa7013dc13d30e3374c39>" data/ERA.ttl >> tests/sparql/property/sparql-era-001-data.ttl
echo "# sparql-era-001 invalid resource" >> tests/sparql/property/sparql-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/36bf1461f295d432dd780fdc507133f908b7a1d4>" data/ERA.ttl >> tests/sparql/property/sparql-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/phaseInfo/ESL984610276_ESA0849_II%20MIXTA_ES08207_length402switchoffbreakerYlowerpantographN>" data/ERA.ttl >> tests/sparql/property/sparql-era-001-data.ttl
cp tests/sparql/property/sparql-era-001-data.ttl tests/sparql/node/sparql-era-001-data.ttl
cp tests/sparql/property/sparql-era-001-data.ttl tests/sparql/node/prefixes-era-001-data.ttl

echo "Getting minCount-era-002 test resources..."
echo "# minCount-era-002 valid resources" > tests/core/property/minCount-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/trainDetectionSystems/64_SI44100_Tir%20P_SI44901_Train_Detection_1>" data/ERA.ttl >> tests/core/property/minCount-era-002-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/trainDetectionSystems/41_SI43777_Tir%20P_EU00185_Train_Detection_2>" data/ERA.ttl >> tests/core/property/minCount-era-002-data.ttl


# Modified shapes to test other features
echo "Getting minInclusive-era-001 test resources..."
echo "# minInclusive-era-001 invalid resource" > tests/core/node/minInclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B49.2266/16.6055>" data/ERA.ttl >> tests/core/node/minInclusive-era-001-data.ttl
echo "# minInclusive-era-001 valid resource" >> tests/core/node/minInclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/locations/%2B5.0966/52.0988>" data/ERA.ttl >> tests/core/node/minInclusive-era-001-data.ttl

echo "Getting message-era-001 test resources..."
cp tests/core/node/datatype-era-001-data.ttl tests/core/misc/message-era-001-data.ttl

# Shapes variations not in ERA shacl
echo "Getting in-era-001 test resources..."
cp tests/core/property/or-era-001-data.ttl tests/core/node/in-era-001-data.ttl
cp tests/core/property/or-era-001-data.ttl tests/core/property/in-era-001-data.ttl

echo "Getting disjoint-era-001 test resources..."
echo "# disjoint-era-001-data valid resources" > tests/core/property/disjoint-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/sectionsOfLine/395e932c196ccac8430d6a1f9dc65c845e41a4f0>" data/ERA.ttl >> tests/core/property/disjoint-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/sectionsOfLine/a4fb948e261140ec29d804ca771987dc424aeea5>" data/ERA.ttl >> tests/core/property/disjoint-era-001-data.ttl
cp tests/core/property/disjoint-era-001-data.ttl tests/core/node/disjoint-era-001-data.ttl
echo "# Synthetic invalid resource" >> tests/core/property/disjoint-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/sectionsOfLine/a4fb948e261140ec29d804ca771987dc424aeea5> <http://data.europa.eu/949/opEnd> <http://data.europa.eu/949/functionalInfrastructure/operationalPoints/FR0000001897>." >> tests/core/property/disjoint-era-001-data.ttl
echo "# Synthetic invalid resource" >> tests/core/node/disjoint-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/sectionsOfLine/a4fb948e261140ec29d804ca771987dc424aeea5> <http://data.europa.eu/949/opEnd> <http://data.europa.eu/949/functionalInfrastructure/sectionsOfLine/a4fb948e261140ec29d804ca771987dc424aeea5>." >> tests/core/node/disjoint-era-001-data.ttl

echo "Getting maxInclusive-era-001 test resources..."
echo "# maxInclusive-era-001-data valid resources" > tests/core/property/maxInclusive-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/283a106ecec2d9ba0be16cbd47e0f09156acd2fd>" data/ERA.ttl >> tests/core/property/maxInclusive-era-001-data.ttl
echo "# Synthetic valid resource" >> tests/core/property/maxInclusive-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tracks/285f79f7bf9d80b5e5080ac0f90df2cc03cf54c9> <http://data.europa.eu/949/maximumPermittedSpeed> \"500\"^^<http://www.w3.org/2001/XMLSchema#integer>." >> tests/core/property/maxInclusive-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tracks/c5015dce90a92072892d50f694ac337e85a8e3c4> <http://data.europa.eu/949/maximumPermittedSpeed> 510.0 ." >> tests/core/property/maxInclusive-era-001-data.ttl
echo "# Synthetic invalid resources" >> tests/core/property/maxInclusive-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tracks/267a882b7e055865f874a0ec7bf74b15e5659d58> <http://data.europa.eu/949/maximumPermittedSpeed> \"510\"^^<http://www.w3.org/2001/XMLSchema#integer>." >> tests/core/property/maxInclusive-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tracks/aba4b5552c35a885d42d368b9490c367aa74c260> <http://data.europa.eu/949/maximumPermittedSpeed> \"a\"." >> tests/core/property/maxInclusive-era-001-data.ttl
cp tests/core/property/maxInclusive-era-001-data.ttl tests/core/node/maxInclusive-era-001-data.ttl

echo "Getting maxLength-era-001 test resources..."
echo "# maxLength-era-001-data valid resources" > tests/core/property/maxLength-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tunnels/010d574ec33c941487e788741459394ed983171e>" data/ERA.ttl >> tests/core/property/maxLength-era-001-data.ttl
echo "# Synthetic valid resource" >> tests/core/property/maxLength-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tunnels/08709321a46939b5b4ead46056d2d558160abd86> <http://data.europa.eu/949/imCode> \"085\"." >> tests/core/property/maxLength-era-001-data.ttl
echo "# Synthetic invalid resource" >> tests/core/property/maxLength-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tunnels/0216a7cb8aa627482be15180128a928f1ad88896> <http://data.europa.eu/949/imCode> \"00745\"." >> tests/core/property/maxLength-era-001-data.ttl
cp tests/core/property/maxLength-era-001-data.ttl tests/core/node/maxLength-era-001-data.ttl

echo "Getting minLength-era-001 test resources..."
cp tests/core/property/maxLength-era-001-data.ttl tests/core/property/minLength-era-001-data.ttl
cp tests/core/property/maxLength-era-001-data.ttl tests/core/node/minLength-era-001-data.ttl

echo "Getting maxCount-era-001 test resources..."
echo "# maxCount-era-001 valid resource" > tests/core/property/maxCount-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/0051fa1b696e840e75d27d87c98a4178199da790>" data/ERA.ttl >> tests/core/property/maxCount-era-001-data.ttl
echo "# maxCount-era-001 syntethic invalid resource" >> tests/core/property/maxCount-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tracks/006c6fda669d79e5658307362eac006d25b5873d>" data/ERA.ttl >> tests/core/property/maxCount-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tracks/006c6fda669d79e5658307362eac006d25b5873d> <http://data.europa.eu/949/minimumTemperature> \"-20\"^^<http://www.w3.org/2001/XMLSchema#integer>" >> tests/core/property/maxCount-era-001-data.ttl

echo "Getting minCount-era-001 test resources..."
echo "# minCount-era-001 valid resource" > tests/core/property/minCount-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/operationalPoints/08406a7d4a515914e456268db99304767fa7c1bb>" data/ERA.ttl >> tests/core/property/minCount-era-001-data.ttl
echo "# minCount-era-001 synthetic invalid resource" > tests/core/property/minCount-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/operationalPoints/8fb9a95852ddf67349c2a794d3e2059ba3004808>" data/ERA.ttl >> tests/core/property/minCount-era-001-data.ttl
sed -i 's_<http://data.europa.eu/949/functionalInfrastructure/operationalPoints/8fb9a95852ddf67349c2a794d3e2059ba3004808> <http://data.europa.eu/949/opName> "Lernacken"._#removed_' tests/core/property/minCount-era-001-data.ttl

echo "Getting nodeKind-era-001 test resources..."
echo "# nodeKind-era-001 valid resource" > tests/core/property/nodeKind-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tunnels/01210440960c0654acec641446e4cfbb61940cec>" data/ERA.ttl >> tests/core/property/nodeKind-era-001-data.ttl
echo "# nodeKind-era-001 synthetic invalid resource" >> tests/core/property/nodeKind-era-001-data.ttl
grep "<http://data.europa.eu/949/functionalInfrastructure/tunnels/010d574ec33c941487e788741459394ed983171e>" data/ERA.ttl >> tests/core/property/nodeKind-era-001-data.ttl
echo "<http://data.europa.eu/949/functionalInfrastructure/tunnels/010d574ec33c941487e788741459394ed983171e> <http://data.europa.eu/949/rollingStockFireCategory> \"not-an-IRI\"." >> tests/core/property/nodeKind-era-001-data.ttl
cp tests/core/property/nodeKind-era-001-data.ttl tests/core/node/nodeKind-era-001-data.ttl
# Free disk space
echo "Cleaning directories..."
rm -r data/raw
rm -r data/vocabularies

echo "Done."