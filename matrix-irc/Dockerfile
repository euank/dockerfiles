FROM node:7

RUN git clone https://github.com/matrix-org/matrix-appservice-irc/ /app
WORKDIR /app
RUN git checkout 0.7.2
RUN npm install

CMD ["node", "app.js", "-c", "/conf/config.yaml", "-f", "/conf/registration.yaml", "-p", "9999"]
