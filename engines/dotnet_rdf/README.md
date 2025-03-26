# dotNetRDF CLI Data validator
Command line RDF data validator against SHACL shapes. It is based on dotNetRDF libraries.

## To compile the application:
1. Make sure you have .NET 8.0 installed.
2. Create a new .NET app by running `dotnet new console -n dotnet_rdf`.
3. Clone the current repository on top of the new project's folder.
4. Navigate to the folder containing the `Program.cs` file.
5. Add `dotNetRdf` packages to the project by running `dotnet add package dotNetRdf --version 3.3.2`.
6. As a result you should be able to run the CLI app.

## Usage
```bash
Description:
  RDF data validation against SHACL shapes.

Usage:
  dotnet run <data> <shapes> <report>

Positional arguments:
  <data>      RDF data
  <shapes>  SHACL shapes
  <report>  Validation report
```
### Example
```bash
dotnet run path/to/rdf_data.ttl path/to/shacl_shapes.ttl path/to/save/report.ttl
```
Apart from the report generated in the specified directory the application gives some relevant information about the validation process.
```
Data graph size: 40
Shapes graph size: 49
Load time: 0.258
Validation time: 0.039
```
Graph size is given in number of triples and time in seconds.

## To create a Docker image
The application can be packed into a Docker image by making use of the provided Dockerfile. \
Type the command `docker build -t dotnetrdf-cli-validator:latest .` to get a ready to use image.

### Example
To feed the app with data and shapes files you could configure a volume. The following listing is an example of how the docker image could be used. 
```docker
docker run -v $(pwd)/data:/data --rm dotnetrdf-cli-validator:latest /data/example_data.ttl /data/example_shapes.ttl /data/example_report.ttl
``` 

