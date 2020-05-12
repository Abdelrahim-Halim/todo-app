FROM node:lts-alpine

# make the 'app' folder the current working directory
WORKDIR /app

# install project dependencies
RUN yarn

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

EXPOSE 8081

CMD yarn serve