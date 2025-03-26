#!/bin/bash
# Get datadump and convert to ntriples
# mkdir data/raw
# cd data/raw
# curl -O https://zenodo.org/records/14605744/files/2025-01-05-rinf-xml-combined.nq.xz
# xz -d 2025-01-05-rinf-xml-combined.nq.xz
# rev 2025-01-05-rinf-xml-combined.nq | cut -d "<" -f 2- |rev |sed 's/.$/./'  > 2025-01-05-rinf-xml-combined.nt
# rm 2025-01-05-rinf-xml-combined.nq
# cd ../..


# Get vocabularies
mkdir data/vocabularies
cd data/vocabularies
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
sed -n 33538045,34761236p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/ES.nt
sed -n 35092900,46412047p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/FR.nt
sed -n 50188479,50215374p data/raw/2025-01-05-rinf-xml-combined.nt > data/raw/LV.nt

# Create a single file for the knowledge graph subsets
for f in data/vocabularies/*.ttl; do (cat "${f}"; echo) >> data/vocabularies/vocabularies.ttl; done
cat data/vocabularies/vocabularies.ttl data/raw/2025-01-05-rinf-xml-combined.nt > data/ERA.ttl
cat data/vocabularies/vocabularies.ttl data/raw/ES.nt > data/ES.ttl
cat data/vocabularies/vocabularies.ttl data/raw/FR.nt > data/FR.ttl
cat data/vocabularies/vocabularies.ttl data/raw/LV.nt > data/LV.ttl

# Free disk space
# rm -r data/raw
# rm -r data/vocabularies

# Get shapes
cd shapes
curl -o era_shapes.ttl https://data-interop.era.europa.eu/era-vocabulary/era-shapes
cd ..

# Subset shapes for SHACL core only # remove REGEX era-sh:.*sparql((.|\n)+?""" .$)
sed '/era-sh:.*sparql/,/.*""".*.$/d' shapes/era_shapes.ttl > shapes/core_shapes.ttl
# Subset shapes for train detection systems
sed -n 4381,4796p shapes/era_shapes.ttl > shapes/tds_shapes.ttl
