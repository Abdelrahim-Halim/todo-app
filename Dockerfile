FROM node:slim
RUN apt-get update &&  apt-get install -y \
    libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

ARG CHROME_VERSION="google-chrome-stable"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install ${CHROME_VERSION:-google-chrome-stable}

# make the 'app' folder the current working directory
WORKDIR /app

# install project dependencies
RUN yarn

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

ENV PORT=4222
ENV CYPRESS_BASE_URL=http://localhost:4222
ENV DEBUG=cypress:*

EXPOSE 4222

CMD yarn serve