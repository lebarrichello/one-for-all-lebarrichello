FROM node:16

COPY package*.json .

RUN npm install

USER node
