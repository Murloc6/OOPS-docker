FROM tomcat:9.0.121-jdk21
RUN apt-get update && apt-get install -y --no-install-recommends maven git

RUN mkdir /oops
ENV MAVEN_OPTS="-Dmaven.repo.local=/.m2/repository"
RUN mkdir -p /.m2/repository
WORKDIR /oops
RUN git clone https://github.com/oeg-upm/OOPS --branch 0.2.0 .
RUN mvn package -Dmaven.test.skip=true
RUN chgrp -R 0 /oops && chmod -R g=u /oops
RUN chgrp -R 0 /.m2 && chmod -R g=u /.m2
USER 1001
