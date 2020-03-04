FROM maven:3.5-jdk-8-alpine as builder
COPY ./ /app
WORKDIR /app
RUN mvn clean install

FROM frolvlad/alpine-oraclejre8:slim
COPY --from=builder /app/target/apirest-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar /app.jar"]

