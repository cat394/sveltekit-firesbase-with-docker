# 開発環境ビルドステージ
FROM node:20-alpine AS dev
WORKDIR /firebase
RUN npm install -g firebase-tools
# Javaをインストール（Firestore Emulatorのために必要）
RUN apk add openjdk17
COPY firebase/ ./
# Firebaseエミュレータのエントリースクリプトをコピー（docker/ の中にある）
COPY docker/firebase-entrypoint.sh /firebase-entrypoint.sh
# 実行権限を付与
RUN chmod +x /firebase-entrypoint.sh
# エントリーポイントスクリプトを実行
ENTRYPOINT ["sh", "/firebase-entrypoint.sh"] 

# 本番環境ビルドステージ
FROM node:20-alpine AS build
WORKDIR /firebase
COPY firebase/package.json firebase/package-lock.json ./
RUN npm install
COPY firebase/ ./
RUN npm run build

# 本番環境のランタイムステージ
FROM node:20 AS prod
WORKDIR /firebase
COPY --from=build /firebase/build ./
CMD ["node", "./build"]