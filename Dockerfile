# syntax=docker/dockerfile:1
#FROM busybox:latest
#COPY --chmod=755 <<EOF /app/run.sh
#!/bin/sh
#while true; do
#  echo -ne "The time is now $(date +%T)\\r"
#  sleep 1
#done
#EOF

#ENTRYPOINT /app/run.sh

#-------------------------------------

FROM ubuntu:24.04

RUN apt-get update -yq \
 && apt-get upgrade \
 && apt-get install curl gnupg -yq \
 && apt-get clean -y

ADD . ./

CMD mvn clean package
