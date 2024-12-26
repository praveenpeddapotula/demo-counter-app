FROM maven as build
WORKDIR /app 
RUN useradd praveen
COPY pom.xml .
COPY . .
RUN mvn package -Dskiptests


FROM openjdk-17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/*.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/app/*.jar" ]
