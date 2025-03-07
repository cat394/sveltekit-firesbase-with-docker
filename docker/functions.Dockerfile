FROM node:20-alpine AS dev
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
CMD ["npm", "run", "build:watch"]

FROM node:20-alpine AS build
WORKDIR /firebase/functions
COPY firebase/functions/package.json firebase/functions/package-lock.json ./
RUN npm install
COPY firebase/functions/ ./
RUN npm run build

# ランタイム環境
FROM node:20 AS prod
WORKDIR /firebase/functions
COPY --from=build /firebase/functions/lib ./lib
CMD ["node", "./lib/index.js"]
