FROM node

RUN apt-get update && apt-get install --no-install-recommends -y curl dirmngr gnupg apt-transport-https ca-certificates
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -\
 && echo 'deb https://deb.nodesource.com/node_8.x stretch main' > /etc/apt/sources.list.d/nodesource.list\
 && apt-get update\
 && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY src /app/src

EXPOSE 3000

CMD [ "npm", "start" ]
