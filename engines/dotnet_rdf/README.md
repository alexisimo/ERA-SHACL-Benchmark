# dotNetRDF CLI Data validator
Command line RDF data validator against SHACL shapes. It is based on dotNetRDF libraries.

## To compile the application:
1. Make sure you have .NET 8.0 installed.
2. Create a new .NET app by running `dotnet new console -n dotnet_rdf`.
3. Clone the current repository on top of the new project's folder.
4. Navigate to the folder containing the `Program.cs` file.
5. Add `System.CommandLine`, `System.CommandLine.NamingConventionBinder` and `dotNetRdf` packages to the project.
6. As a result you should be able to run the CLI app.

## Usage
```bash
Description:
  RDF data validation against SHACL shapes.

Usage:
  dotnet_rdf [options]

Options:
  --data <data>      RDF data
  --shapes <shapes>  SHACL shapes
  --report <report>  Validation report

```
### Example
```bash
dotnet run -- --data path/to/rdf_data.ttl --shapes path/to/shacl_shapes.ttl --report path/to/save/report.ttl
```
Apart from the report generated in the specified directory the application gives some relevant information about the validation process.
```
Data graph size: 40
Shapes graph size: 49
Estimated load time: 0.258
Estimated validation time: 0.039
```
Graph size is given in number of triples and time in seconds.
## Additional options
    --version          Show version information
    -?, -h, --help     Show help and usage information

### Docker
The application can be packed into a Docker image by making use of the provided Dockerfile. \
Type the command `docker build -t dotnetrdf-validation-experiment:v0.1 .` to get a ready to use image.

When creating a container from the just built image it will call `run.sh` by default which is a bash script for batch validation created for Benchmarking purposes. 

You can customize the Dockerfile entrypoint to point to the CLI app in the corresponding `ENTRYPOINT` line. 
