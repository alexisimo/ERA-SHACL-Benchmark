# Use an official Python runtime as a parent image
FROM python:3.9

RUN mkdir /maplib

RUN mkdir /data
RUN mkdir /shapes

RUN mkdir /reports

# Set the working directory in the container
WORKDIR /maplib

# Copy the requirements file into the container
COPY requirements.txt .
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the wheel file into the container
# COPY maplib-0.12.7-cp310-cp310-manylinux_2_34_x86_64.whl .
COPY maplib-0.15.8-cp39-abi3-manylinux_2_24_x86_64.whl .

# Install the maplib package
# RUN pip install maplib-0.12.7-cp310-cp310-manylinux_2_34_x86_64.whl
RUN pip install maplib-0.15.8-cp39-abi3-manylinux_2_24_x86_64.whl

# Copy the rest of the application code into the container
COPY . .

# Command to run the cli application
ENTRYPOINT ["python", "validate.py"]
