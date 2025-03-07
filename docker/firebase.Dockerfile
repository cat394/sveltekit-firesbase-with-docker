FROM node:20-alpine
WORKDIR /firebase
RUN npm install -g firebase-tools
RUN apk add openjdk17
COPY firebase/ ./
COPY docker/firebase-entrypoint.sh /firebase-entrypoint.sh
RUN chmod +x /firebase-entrypoint.sh
ENTRYPOINT ["sh", "/firebase-entrypoint.sh"] 