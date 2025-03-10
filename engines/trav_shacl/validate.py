import os
import argparse
import time
import rdflib
import re
from TravSHACL import parse_heuristics, GraphTraversal, ShapeSchema

def trav_shacl_validate(DATA, SHAPES, REPORT):
    # Data parsing
    g = rdflib.Graph()
    # Start measuring the loading time
    load_tic = time.time()
    with open(DATA, "r", encoding="utf-8") as file:
        g.parse(data=file.read())
    load_tictoc = time.time() - load_tic
    print(f"Number of data statements parsed: {len(g)}")
    print(f"Estimated load time: {load_tictoc}")

    prio_target = 'TARGET'  # shapes with target definition are preferred, alternative value: ''
    prio_degree = 'IN'  # shapes with a higher in-degree are prioritized, alternative value 'OUT'
    prio_number = 'BIG'  # shapes with many constraints are evaluated first, alternative value 'SMALL'

    shape_schema = ShapeSchema(
        schema_dir=SHAPES,
        endpoint=g,
        endpoint_user=None,  # username if validating a private endpoint
        endpoint_password=None,  # password if validating a private endpoint
        graph_traversal=GraphTraversal.DFS,
        heuristics=parse_heuristics(prio_target + ' ' + prio_degree + ' ' + prio_number),
        use_selective_queries=True,
        max_split_size=256,
        output_dir=REPORT,  # directory where the output files will be stored
        order_by_in_queries=False,  # sort the results of SPARQL queries in order to ensure the same order across several runs
        save_outputs=True  # save outputs to output_dir, alternative value: False
    )
    tic = time.time()

    result = shape_schema.validate()  # validate the SHACL shape schema
    tictoc = time.time() - tic
    print( "Estimated validation time: ", tictoc)


parser = argparse.ArgumentParser(
    prog='pyshacl_validator',
    description='Validate RDF data against SHACL shapes using the PySHACL engine.',
    )

parser.add_argument('data', metavar='data', help='path to RDF data input file')
parser.add_argument('shapes', metavar='shapes', help='path to SHACL shapes input file')
parser.add_argument('report', metavar='report', help='path to validation report output file')

args = parser.parse_args()

trav_shacl_validate(args.data, args.shapes, args.report)
