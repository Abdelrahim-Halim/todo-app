FROM node:slim
RUN apt-get update &&  apt-get install -y \
    libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# make the 'app' folder the current working directory
WORKDIR /app

# install project dependencies
RUN yarn

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

ENV PORT=8081
ENV CYPRESS_BASE_URL=http://localhost:8081
ENV DEBUG=cypress:*

EXPOSE 8081

CMD yarn serve