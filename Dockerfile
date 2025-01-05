FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

#the above code install node in your ununtu image also you can also write FROM node and the rest RUN would not be required 

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

#copy the above file source : destination 

RUN npm install

# when you container is spanned RUN this command 

ENTRYPOINT [ "node", "main.js" ]
# when ever anyone runs this conatiner it will run node and main.js


#now to build this image run the following commands on the terminal 

# docker build -t <name of your image> <path of the docker file >
# doker build -t youtube-nodejs .
# here . means the Dockerfile is in the same folder only
#