FROM roboxes/rhel8:4.1.4 AS Builder

#Install Java 8
RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm > jdk-8u112-linux-x64.rpm && \
    sudo rpm -i jdk-8u112-linux-x64.rpm
RUN ./mvnw install
EXPOSE 8080
ADD target/spring-boot-docker.jar spring-boot-docker.jar
ENTRYPOINT ["java","-jar","/spring-boot-docker.jar"]