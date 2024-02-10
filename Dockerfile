# Use the .NET runtime as the base image
FROM mcr.microsoft.com/dotnet/runtime:8.0

# Install Python
RUN apt-get update

RUN apt install -y python3.11 python3-pip


RUN python3.11 -m pip install --upgrade --break-system-packages pip
RUN python3.11 -m pip install --break-system-packages numpy pandas ipykernel matplotlib geopandas folium mapclassify mikeio1d

WORKDIR /tmp
ADD start_kernel.sh .

CMD bash /tmp/start_kernel.sh