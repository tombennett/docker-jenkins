FROM rocklobster/jdk:8.0.121

LABEL maintainer="tom@thingamajig.net"
LABEL description="Windows Server Core with Jenkins"

ENV JENKINS_VERSION 2.46.1

RUN powershell -executionpolicy bypass -command \
      # Install Jenkins using chocolatey
      choco install jenkins -y --version $env:JENKINS_VERSION

#RUN powershell -executionpolicy bypass -command \
#      # Configure Jenkins
#      $Config = Get-Content -Path "${ENV:ProgramFiles(x86)}\Jenkins\Jenkins.xml" ;\
#      $NewConfig = $Config -replace '--httpPort=[0-9]*\s','--httpPort=80 ' ;\
#      Set-Content -Path "${ENV:ProgramFiles(x86)}\Jenkins\Jenkins.xml" -Value $NewConfig -Force ;\
#      Restart-Service -Name Jenkins
#      Get-Content 'C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword'

EXPOSE 8080

ENTRYPOINT ["C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"] 

# WHEN Complete, run the following command to get the initialAdminPassword
# docker exec CONTAINERID powershell "cat 'C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword'"
