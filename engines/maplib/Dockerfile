# Use an official Python runtime as a parent image
FROM python:3.10

RUN mkdir /maplib

RUN mkdir /data
RUN mkdir /shapes
RUN mkdir /results
RUN mkdir /reports

# Set the working directory in the container
WORKDIR /maplib

# Copy the requirements file into the container
COPY requirements.txt .
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the wheel file into the container
COPY maplib-0.12.7-cp310-cp310-manylinux_2_34_x86_64.whl .
# Install the maplib package
RUN pip install maplib-0.12.7-cp310-cp310-manylinux_2_34_x86_64.whl

# Copy the rest of the application code into the container
COPY . .

# Make shell script executable
RUN chmod +x run.sh

# Command to run the cli experiment
ENTRYPOINT ["./run.sh"]