FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y firefox wget
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY ./ /app/
RUN npm test -- --singleRun --browsers=FirefoxHeadless
