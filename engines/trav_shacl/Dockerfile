# Use an official Python runtime as a parent image
FROM python:3.10

RUN mkdir /trav_shacl

RUN mkdir /data
RUN mkdir /shapes
RUN mkdir /reports

# Set the working directory in the container
WORKDIR /trav_shacl

# Copy the requirements file into the container
COPY requirements.txt .
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make shell script executable
RUN chmod +x entrypoint.sh

# Command to run the cli experiment
ENTRYPOINT ["./entrypoint.sh"]
