# base image
FROM node:lts-alpine


# define working directory
RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app
WORKDIR /home/node/app

# copy all files
COPY --chown=node:node . .

# set user
USER node

# install dependencies
RUN npm install

# build
RUN npm run build

# expose port
EXPOSE 3000

# run command
CMD ["npm", "start"]