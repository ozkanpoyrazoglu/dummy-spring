FROM openjdk:18-jdk

COPY . /data/app
WORKDIR /data/app

EXPOSE 8080

CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]
