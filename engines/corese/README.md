# Jena CLI Data validator
Command line RDF data validator against SHACL shapes. It is based on Jena libraries, which supports SHACL shapes, SHACL-SPARQL and SPARQL constraints with GeoSPARQL queries.

## To compile the application:
1. Make sure you have Java, the JDK and Maven installed.
2. Clone the current repository.
3. Navigate to the folder containing the `pom.xml` file.
4. Run `mvn clean compile assembly:single`.
5. As a result you should be able to access to a JAR file in the `target` folder.

_The JAR provided in `target` was compiled with the Java openjdk version 17.0.11 and Apache Maven 3.9.6._

## Usage
    Validator [-h] <data> <shapes> <report>
    *     <data>     RDF data
    *     <shapes>   SHACL shapes
    *     <report>   Validation report

The fields marked with an \* are mandatory.

### Example
```bash
java -jar target/validator-0.0.1-SNAPSHOT-jar-with-dependencies.jar path/to/rdf_data.ttl path/to/shacl_shapes.ttl path/to/save/report.ttl
```
Apart from the report generated in the given directory the application gives some relevant information about the validation process.
```
Data graph size: 40
Estimated load time: 0.258
Shapes graph size: 49
Report graph size: 115
Estimated validation time: 0.039
```
Graph size is given in number of triples and time in seconds.
## Options
    -h, --help     Display help

### Docker
After the application is compiled into a JAR, a Docker image can be built by making use of the provided Dockerfile. \
Type the command `docker build -t jena-validation-experiment:v0.1 .` to get a ready to use image.

### Example
To feed the app with data and shapes files a volume should be configured. The following listing is an example of how the docker image could be used. 
```docker
docker run -v $(pwd)/data:/cli-data-validator/data --rm cli_data_validator:latest /cli-data-validator/data/example_data.ttl /cli-data-validator/data/example_shapes.ttl /cli-data-validator/data/example_report.ttl

```