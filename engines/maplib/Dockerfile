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
COPY maplib-0.18.9-cp39-abi3-manylinux_2_28_x86_64.whl .

# Install the maplib package
RUN pip maplib-0.18.9-cp39-abi3-manylinux_2_28_x86_64.whl

# Copy the rest of the application code into the container
COPY . .

# Command to run the cli application
ENTRYPOINT ["python", "validate.py"]
