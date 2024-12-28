FROM maven:3.8.1-openjdk-17 as build
WORKDIR /app 
RUN useradd praveen
RUN mkdir -p /home/praveen/.m2/repository && chown -R praveen:praveen /home/praveen/.m2
USER praveen
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package


FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/app/app.jar" ]
