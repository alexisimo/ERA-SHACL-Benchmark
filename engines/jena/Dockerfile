FROM maven:3.9.6

RUN mkdir /jena

RUN mkdir /data
RUN mkdir /shapes
RUN mkdir /results
RUN mkdir /reports

# Set the working directory in the container
WORKDIR /jena

# Copy the rest of the application code into the container
COPY . . 

# Complile application
RUN mvn clean compile assembly:single

# Make shell script executable
RUN chmod +x run.sh

# Command to run the cli application
ENTRYPOINT ["./run.sh"]
