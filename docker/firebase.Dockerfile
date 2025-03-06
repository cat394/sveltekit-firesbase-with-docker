FROM node:20-alpine

WORKDIR /firebase

# Firebase CLIをインストール
RUN npm install -g firebase-tools

# Javaをインストール（Firestore Emulatorのために必要）
RUN apk add openjdk17

# Firebaseの設定ファイルをコピー
COPY ../firebase/ ./

# Firebaseエミュレータのエントリースクリプトをコピー（docker/ の中にある）
COPY docker/firebase-entrypoint.sh /firebase-entrypoint.sh

# 実行権限を付与
RUN chmod +x /firebase-entrypoint.sh

# エントリーポイントスクリプトを実行
ENTRYPOINT ["sh", "/firebase-entrypoint.sh"]
