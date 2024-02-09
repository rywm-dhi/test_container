# Use the .NET runtime as the base image
FROM mcr.microsoft.com/dotnet/runtime:8.0

# Set the working directory
WORKDIR /

# Install Python
RUN apt-get update \
    && apt-get install -y python3 python3-venv python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create and activate a virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Install libraries
RUN pip3 install ipykernel numpy pandas matplotlib geopandas folium mapclassify mikeio1d