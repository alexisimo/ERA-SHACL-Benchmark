# Use an official Python runtime as a parent image
FROM python:3.10

RUN mkdir /pyshacl

RUN mkdir /data
RUN mkdir /shapes

RUN mkdir /reports

# Set the working directory in the container
WORKDIR /pyshacl

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Command to run the cli application
ENTRYPOINT ["python", "validate.py"]
