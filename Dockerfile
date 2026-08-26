FROM tomcat:9.0.121-jdk21
RUN apt-get update && apt-get install -y --no-install-recommends maven git

RUN mkdir /oops
WORKDIR /oops
RUN git clone https://github.com/oeg-upm/OOPS --branch 0.2.0 .
RUN mvn package -Dmaven.test.skip=true -Dmaven.repo.local=/oops/.m2/repository
RUN chgrp -R 0 /oops && chmod -R g=u /oops
USER 1001
