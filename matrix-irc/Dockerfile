FROM node:22

RUN git clone https://github.com/matrix-org/matrix-appservice-irc/ /app
WORKDIR /app
RUN git checkout 3.0.5
RUN npm install

CMD ["node", "app.js", "-c", "/conf/config.yaml", "-f", "/conf/registration.yaml", "-p", "9999"]
