FROM mcr.microsoft.com/dotnet/core/sdk:3.1.100-bionic

RUN apt-get update
RUN apt-get install -qq -y libcurl3
RUN apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common 

# DOCKER
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN apt-get clean
RUN apt-get autoremove

# MONO
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN sh -c 'echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list'
RUN apt update
RUN apt install -y mono-complete

RUN dotnet tool install -g Cake.Tool --version 0.35.0
ENV PATH="$PATH:/root/.dotnet/tools"
