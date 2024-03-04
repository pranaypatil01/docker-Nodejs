# Use AWS Linux as the base image
FROM amazonlinux:latest

# Update the package repository and install necessary packages as root
USER root
RUN yum update -y && \
    yum install -y git && \
    yum install -y npm

# Set the working directory
WORKDIR /opt

# Clone the GitHub repository
RUN git clone https://github.com/PrajwalNirmal7/Frontend.git

# Change the working directory to /opt/Frontend
WORKDIR /opt/Frontend

# Install npm dependencies
RUN npm install

# Run npm fund for checking funding information
RUN npm fund

# Expose port 3000 for the Node.js application
EXPOSE 3000

# Start the Node.js application
CMD ["npm", "start"]
