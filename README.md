# ERA-SHACL-Benchmark
This is a real data SHACL engines benchmark. It is based on a real use case in the railway domain comprising the whole European railway infrastructure information (RINF). 

<!-- ## The ERA Knowledge graph
### ERA Ontology and vocabularies
...
### Data description
...
### SHACL shapes
... -->

## The features unitary test, and report quality benchmark
From the whole set of SHACL shapes analysis multiple test cases were extracted as unitary tests of different features. The SHACL test suite shapes were taken as a base to formulate the subset of features this knowledge graph is capable to test. Not all the cases are covered. This unitary test, despite not covering all the test suite cases, presents new real cases not tested before.
  
The generated validation reports are the assets used to assess each engine capabilities. 

## The load and validation times, and memory consumption benchmark
The aproximately 55 million triples of the knowledge graph are split into three orders of magnitude tests and validated against three distinct complexities subsets of SHACL shapes. Totalling nine combinations of experiments per engine.

Each tested engine was configured to run in memory as recommended by their respective documentation. To ensure reproducibility and portability, the engines were included in the simplest library use case within a CLI application and packed in docker images. The loading and validation times were measured within each engine's operation using time measurement standard libraries in the corresponding programming language each library has been programmed with.

## Usage instructions

1. Clone this repository.
2. Execute the `get_data.sh` script to process and store the knowledge graph subsets and shapes for the benchmark.
3. Make sure you have Docker installed with admin access (or execute everything with sudo).
4. Build the images using the `build_images.sh` script available in the engines folder. 
5. Run the features' tests script `run_test.sh` to generate the test reports.
6. Finally execute the script `run_benchmark.sh` to run the benchmark.

## How to use this benchmark for testing other engines
If you want to test an additional engine or a different version create a simple CLI app following the requirements described below and build it inside a Docker image. Then, customize the benchmark script to include it in the list of engines to be tested in the corresponding line.

### CLI application requirements
- _Positional arguments:_ The paths pointing to a single data triples turtle file, a single shapes triples turtle file, and a single validation report turtle file are the positional arguments the app should parse in that order.
- In addition, the load and validation time measurements metrics should be printed on the command line as follows so the benchmark script could capture them:
    ```bash
    Load time: 0.258
    Validation time: 0.039
    ```
- Time should be measured in seconds and printed without units.
- Measuring the memory consumption it's not required for the script takes the peak from a sample of the running Docker memory profile.

Feel free to use any of the other engines' images code as a reference for a correct app implementation. 