# %%
import rdflib
from io import BytesIO
import pandas as pd
import rdflib.compare
from pyshacl import validate

# %%

sg = rdflib.Graph()
with open('./reports_shapes.ttl', "r") as file:
    sg.parse(data=file.read())

for dataset in ["ES", "FR", "ERA"]:
    for shapes in ["tds", "core", "era"]:
        for engine in ["maplib", "rdf4j", "rdfunit", "dotnet_rdf", "corese", "pyshacl"]:
            g = rdflib.Graph()
            try:
                with open(f'../results/{engine}/reports/{dataset}_{shapes}_report.ttl', "r", encoding="utf-8") as file:
                    g.parse(data=file.read())

                # SHACL validation block
                r = validate(data_graph=g, shacl_graph=sg, inference="", advanced=True)
                conforms, vres_graph, results_text = r

                # Generate report
                vres_graph.serialize(format="turtle", destination=f"../results/reports/{engine}_{dataset}_{shapes}_report_report.ttl")
            except:
                pass
