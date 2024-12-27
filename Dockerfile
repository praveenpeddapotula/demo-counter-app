FROM maven as build
WORKDIR /app 
RUN useradd praveen
USER praveen
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package -Dskiptests


FROM openjdk-17-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar /app/*.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/app/*.jar" ]
