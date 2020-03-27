FROM adoptopenjdk/openjdk13:alpine-jre
MAINTAINER levi <1223yys@naver.com>

COPY ./build/libs/jenkins-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]