# 開発環境ステージ
FROM node:18-alpine AS dev
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
CMD ["npm", "run", "build:watch"]

# ビルドステージ
FROM node:18-alpine AS build
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
RUN npm run build

# ランタイム環境
FROM node:18-alpine AS prod
WORKDIR /firebase/functions
COPY --from=build /firebase/functions/lib ./lib
CMD ["node", "./lib/index.js"]
