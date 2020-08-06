FROM openjdk:11.0.3-jre-slim-stretch
VOLUME /temp
ADD target/spring-petclinic-*.jar /petclinic.jar
EXPOSE 8080
RUN bash -c 'touch /petclinic.jar'

java jar target/*.jar
