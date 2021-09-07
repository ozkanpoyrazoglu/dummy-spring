FROM maven:3.8.2-jdk-8

COPY . /data/app
WORKDIR /data/app

RUN ["mvn", "clean", "install"]

EXPOSE 8080

CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]
