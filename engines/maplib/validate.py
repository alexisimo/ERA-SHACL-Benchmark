import os
import argparse
from maplib import Mapping
import time
import rdflib
import re

parser = argparse.ArgumentParser(
    prog='pyshacl_validator',
    description='Validate RDF data against SHACL shapes using the PySHACL engine.',
    )

parser.add_argument('data', metavar='data', help='path to RDF data input file')
parser.add_argument('shapes', metavar='shapes', help='path to SHACL shapes input file')
parser.add_argument('report', metavar='report', help='path to validation report output file')

args = parser.parse_args()

def maplib_validate(DATA, SHAPES, REPORT):
    m = Mapping()
    # Start measuring the loading time
    load_tic = time.time()
    m.read_triples(DATA)
    load_tictoc = time.time() - load_tic
    print("Load estimated time: ", load_tictoc)

    # Parse shacl shapes to rdflib graph 
    shape_graph = "urn:eu:shacl"
    m.read_triples(SHAPES, graph=shape_graph)

    # SHACL validation block
    # Measuring the validation time
    tic = time.time()
    report = m.validate(shape_graph=shape_graph)
    tictoc = time.time() - tic
    print( "Validation estimated time: ", tictoc)

    # Generate report
    report.graph().write_ntriples(os.path.splitext(REPORT)[0]+".nt")

    vres_graph = rdflib.Graph()
    with open(os.path.splitext(REPORT)[0]+".nt", "r", encoding="utf-8") as file:
        content = re.sub(r'\\"', '"', file.read()) # fixing an error in maplib nt writer
        vres_graph.parse(data=content, format="nt")
    vres_graph.serialize(format="turtle", destination=REPORT)

maplib_validate(args.data, args.shapes, args.report)
