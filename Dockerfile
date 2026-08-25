FROM tomcat:9.0.121-jdk21

RUN apt-get update && apt-get install -y --no-install-recommends maven git

RUN git clone https://github.com/oeg-upm/OOPS --branch 0.2.0 /oops

WORKDIR /oops/

RUN mvn package -Dmaven.test.skip=true
