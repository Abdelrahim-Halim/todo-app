FROM node:slim
RUN apt-get update &&  apt-get install -y \
    libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb git && \
    apt-get clean 

# make the 'app' folder the current working directory
WORKDIR /app

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# install project dependencies
RUN yarn install


ENV PORT=5000
ENV CYPRESS_BASE_URL=http://localhost:5000
ENV DEBUG=cypress:*

EXPOSE 5000

ENTRYPOINT [ "yarn" ]

CMD [ "serve" ]