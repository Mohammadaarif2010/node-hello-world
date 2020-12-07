FROM node

RUN yum update all -y

RUN mkdir /app
WORKDIR /app

COPY package*.json /app/

RUN yum install npm

COPY src /app/src

EXPOSE 3000

CMD [ "npm", "start" ]
