FROM node:alpine
 
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
 
RUN mkdir -p /usr/src/node-app && chown -R node:node /usr/src/node-app
 
WORKDIR /usr/src/node-app

# Copying files as node user
COPY --chown=node:node . .

# Uncommenting USER node to switch to non-root user
USER node

# Installing dependencies
RUN npm install

EXPOSE 3800

# Start the application
CMD ["npm", "start"]

