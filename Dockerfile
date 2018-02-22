FROM microsoft/dotnet:2.0.5-sdk-2.1.4-jessie

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian jessie main" | tee /etc/apt/sources.list.d/mono-official.list
RUN apt-get update
RUN apt-get -qq -y install mono-complete