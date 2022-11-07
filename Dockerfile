FROM keymetrics/pm2:16-jessie

WORKDIR /app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

ENTRYPOINT ["/bin/bash", "start.sh"]
