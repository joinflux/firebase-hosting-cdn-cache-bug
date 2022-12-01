FROM node:14-slim

ENV PORT 7979
ENV HOST 0.0.0.0

WORKDIR /usr/src/packages/api

COPY package.json yarn.lock .
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build

CMD ["node", "./dist/index.js"]

