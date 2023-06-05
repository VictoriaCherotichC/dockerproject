FROM openjdk:8

WORKDIR work

COPY target/spring-boot-docker.jar work
EXPOSE 8080

ENTRYPOINT ["java","-jar","spring-boot-docker.jar"]