FROM rocklobster/docker-chocolatey:latest

LABEL maintainer="tom@thingamajig.net"
LABEL description="Windows Server Core with Jenkins"

RUN powershell -executionpolicy bypass -command \
      # Install JDK 8
      choco install jdk8 -y

RUN powershell -executionpolicy bypass -command \
      # Install Jenkins using chocolatey
      choco install jenkins -y

RUN powershell -executionpolicy bypass -command \
      # Configure Jenkins
      $Config = Get-Content -Path "${ENV:ProgramFiles(x86)}\Jenkins\Jenkins.xml" ;\
      $NewConfig = $Config -replace '--httpPort=[0-9]*\s','--httpPort=80 ' ;\
      Set-Content -Path "${ENV:ProgramFiles(x86)}\Jenkins\Jenkins.xml" -Value $NewConfig -Force ;\
      Restart-Service -Name Jenkins

EXPOSE 80

CMD [ "powershell" ]