FROM rocklobster/docker-chocolatey:latest

LABEL maintainer="tom@thingamajig.net"
LABEL description="Windows Server Core with Jenkins"

RUN powershell -executionpolicy bypass -command \
      # Install JDK 8
      choco install jdk8 -y

RUN powershell -executionpolicy bypass -command \
      # Install Jenkins using chocolatey
      choco install jenkins -y

EXPOSE 8080

CMD [ "powershell.exe" ] 
