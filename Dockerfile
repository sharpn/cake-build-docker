#FROM mcr.microsoft.com/dotnet/core/sdk:3.1
FROM gittools/gitversion:5.1.4-linux-ubuntu-18.04-netcoreapp3.1

RUN apt-get update
RUN apt-get install -y software-properties-common

# Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
RUN apt-get update && apt-get install -y docker-ce

RUN dotnet tool install -g Cake.Tool --version 0.35.0
ENV PATH="$PATH:/root/.dotnet/tools"
