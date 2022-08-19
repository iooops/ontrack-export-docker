# FROM node:14.5.0-alpine3.11
FROM node:18.3.0-alpine3.16

# Create app directory
WORKDIR /usr/src/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN apk update
RUN apk add ffmpeg
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 9000
ENTRYPOINT [ "node", "server.js" ]
