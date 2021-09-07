FROM maven:3.6.1-jdk-8-alpine

COPY . /data/app
WORKDIR /data/app

RUN ["mvn", "clean", "install"]

EXPOSE 8080

CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]
