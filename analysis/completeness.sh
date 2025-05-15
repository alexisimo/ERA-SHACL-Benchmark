for cc in ValidationResult SPARQLConstraintComponent PatternConstraintComponent MaxCountConstraintComponent DatatypeConstraintComponent MinInclusiveConstraintComponent MaxExclusiveConstraintComponent ClassConstraintComponent OrConstraintComponent; do
    echo $cc >> ../results/completeness.csv
    grep -c $cc ../results/*/reports/*.ttl >> ../results/completeness.csv
done
