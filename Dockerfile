FROM ubuntu:20.04

# Set environment variable to disable prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Python
RUN apt-get update
RUN apt-get install -y python3 python3-pip

# Install Mono
RUN apt-get install -y ca-certificates gnupg
RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y mono-xsp4

# Install .NET runtime
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-runtime-8.0

# Install python libraries
RUN pip install ipykernel mikeio1d geopandas matplotlib folium mapclassify

WORKDIR /tmp
ADD start_kernel.sh .

CMD bash /tmp/start_kernel.sh