FROM node:22-alpine

WORKDIR /firebase

RUN npm install -g firebase-tools

# Firebase Functions エミュレーターの依存である Java 17 (OpenJDK 17) をインストール
# Firestore エミュレーターや Authentication エミュレーターも Java が必要
RUN apk add openjdk17

COPY firebase/ ./

# Firebase エミュレーターを起動し、Firestore, Auth, Storage, Functions のエミュレーターのみを有効化
CMD ["firebase", "emulators:start", "--only", "firestore,auth,storage,functions"]
