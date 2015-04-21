FROM maven:3.3-jdk-8
VOLUME src /usr/src
ADD src/ooapi-source /usr/src/ooapi-source
ADD src/tuexample-source /usr/src/tuexample-source
RUN cd /usr/src/ooapi-source && mvn clean install
RUN cd /usr/src/tuexample-source && mvn clean install
