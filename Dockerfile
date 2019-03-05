FROM node:10-alpine

RUN mkdir /opt/scratch
WORKDIR /opt/scratch

RUN apk add python make gcc g++
RUN npm i -g npm@latest
RUN npm init -y
RUN npm i @buzuli/ops-tools

COPY ./entrypoint.sh /opt/scratch/entrypoint.sh

ENTRYPOINT ["/opt/scratch/entrypoint.sh"]
CMD []
