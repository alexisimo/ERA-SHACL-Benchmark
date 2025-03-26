import os
import argparse
import time
import rdflib
from pyshacl import validate

parser = argparse.ArgumentParser(
    prog='pyshacl_validator',
    description='Validate RDF data against SHACL shapes using the PySHACL engine.',
    )

parser.add_argument('data', metavar='data', help='path to RDF data input file')
parser.add_argument('shapes', metavar='shapes', help='path to SHACL shapes input file')
parser.add_argument('report', metavar='report', help='path to validation report output file')

args = parser.parse_args()

def pyshacl_validate(DATA, SHAPES, REPORT):
    # Data parsing
    g = rdflib.Graph()

    # Start measuring the loading time
    load_tic = time.time()
    with open(DATA, "r", encoding="utf-8") as file:
        g.parse(data=file.read())
    load_tictoc = time.time() - load_tic
    print(f"Data graph size: {len(g)}")
    print(f"Load time: {load_tictoc}")

    # Parse shacl shapes to rdflib graph 
    sg = rdflib.Graph()
    with open(SHAPES, "r") as file:
        sg.parse(data=file.read())
    print(f"Shapes graph size: {len(sg)}")

    # SHACL validation block
    # Measuring the validation time
    tic = time.time()
    r = validate(data_graph=g, shacl_graph=sg, inference="")
    conforms, vres_graph, results_text = r
    tictoc = time.time() - tic

    # Generate report
    vres_graph.serialize(format="turtle", destination=REPORT)
    print(f"Validation time: {tictoc}")

pyshacl_validate(args.data, args.shapes, args.report)
