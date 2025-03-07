# 開発環境ステージ
FROM node:20 AS dev
WORKDIR /app
COPY app/package.json app/package-lock.json ./
RUN npm install
COPY ../app/ ./
EXPOSE 5173
CMD ["npm", "run", "dev"]

# 本番環境ビルドステージ
FROM node:20 AS build
WORKDIR /app
COPY app/package.json app/package-lock.json ./
RUN npm install
COPY ../app/ .
RUN npm run build

# 本番環境のランタイムステージ
FROM node:20 AS prod
WORKDIR /app
COPY --from=build app/build ./
CMD ["node", "./build"]