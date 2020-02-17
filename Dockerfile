FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt-get update
RUN apt-get install -y software-properties-common

# Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
RUN apt-get update && apt-get install -y docker-ce

ENV PATH $PATH:$HOME/.dotnet/tools
RUN dotnet tool install -g Cake.Tool --version 0.35.0
