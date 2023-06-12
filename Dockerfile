# Use a Maven base image with Java 8
FROM maven:3.8.4-openjdk-8-slim AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Download dependencies and cache them
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use a Java 8 base image for the final image
FROM openjdk:8-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/myapp.jar .

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "myapp.jar"]