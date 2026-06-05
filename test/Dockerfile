FROM node:lts-alpine3.23
COPY . /var/app
WORKDIR /var/app
RUN npm install
#CMD [ "tail", "-f", "/dev/null" ]
CMD [ "npm", "test" ]