# Trav-SHACL CLI Data validator
Command line RDF data validator against SHACL shapes. It is based on Trav-SHACL and rdfLib libraries.

## To run the application:
1. Make sure you have Python 3.7 or above installed.
2. Clone the current repository.
3. Navigate to the folder containing the `requirements.txt` file.
4. Run `pip install -r requirements.txt` .
5. As a result you should be able to run `validate.py` command line app as described below .

_The application was developed using Python version 3.10_


## Usage
To use this application you can run the entrypoint script `validate.py` as follows: 

    python validate.py [-h] <data> <shapes> <report>
    *     <data>     RDF data
    *     <shapes>   SHACL shapes
    *     <report>   Validation report
_The fields marked with an \* are mandatory._
## Options
The optional arguments are the following:

    -h, --help            show this help message and exit


### Example
```bash
python validate.py path/to/rdf_data.ttl path/to/shacl_shapes.ttl path/to/save/report_folder
```
Apart from the report generated in the given directory the application gives some relevant information about the validation process.
```
Data graph size: 40
Shapes graph size: 49
Load time: 0.258
Validation time: 0.039
```
Graph size is given in number of triples and time in seconds.

## To create a Docker image
The application can be packed into a Docker image by making use of the provided Dockerfile. \
Type the command `docker build -t travshacl-cli-validator:latest .` to get a ready to use image.

When creating a container from the just built image it will call `entrypoint.sh` by default which is a bash script that passes individual files as arguments to the app. 


### Example
To feed the app with data and shapes files you could configure a volume. The following listing is an example of how the docker image could be used. 
```docker
docker run -v $(pwd)/data:/data --rm travshacl-cli-validator:latest /data/example_data.ttl /data/example_shapes.ttl /data/example_report.ttl
``` 