FROM cakebuild/cake:2.1-sdk-bitrise-mono

RUN apt-get update
RUN apt-get install -y software-properties-common

# NODEJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs

# Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
RUN apt-get update && apt-get install -y docker-ce
