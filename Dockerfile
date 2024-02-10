# Use the .NET runtime as the base image
FROM mcr.microsoft.com/dotnet/runtime:8.0

# Install Python
RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install numpy pandas ipykernel matplotlib geopandas folium mapclassify mikeio1d

WORKDIR /tmp
ADD start_kernel.sh .

CMD bash /tmp/start_kernel.sh
