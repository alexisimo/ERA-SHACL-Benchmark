FROM maven:3.9.6

RUN mkdir /rdfunit

RUN mkdir /data
RUN mkdir /shapes
RUN mkdir /reports

# Set the working directory in the container
WORKDIR /rdfunit

# Copy the rest of the application code into the container
COPY . . 

# Make shell script executable
RUN chmod +x entrypoint.sh

# Command to run the cli application
ENTRYPOINT ["./entrypoint.sh"]

## Alternative
## Compile application
# RUN mvn clean compile assembly:single
## Command to run the compiled JAR
# ENTRYPOINT ["java","-jar", "target/validator-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]

