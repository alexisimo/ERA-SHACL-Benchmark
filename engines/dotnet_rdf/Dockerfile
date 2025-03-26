FROM ubuntu:noble
RUN apt-get update \
    && apt-get install -y dotnet-sdk-8.0 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /dotnet_rdf

RUN mkdir /data
RUN mkdir /shapes
RUN mkdir /reports

# Create new .NET console project
RUN dotnet new console -n dotnet_rdf

# Set the working directory in the container
WORKDIR /dotnet_rdf

# Add required packages
RUN dotnet add package dotNetRdf --version 3.3.2

# Copy the rest of the application code into the container
COPY . . 

# Command to run the cli application
ENTRYPOINT ["dotnet", "run"]
