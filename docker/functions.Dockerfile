# 開発環境ステージ
FROM node:18-alpine AS dev
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
CMD ["npm", "run", "build:watch"]

# ランタイム環境
FROM node:18-alpine AS prod
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
RUN npm run build
CMD ["node", "./lib/index.js"]
