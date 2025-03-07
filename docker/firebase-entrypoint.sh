# 環境変数の設定を行い、service-account-key.jsonを使えるようにする
set -e

# Firebase エミュレーターを起動する
firebase emulators:start --only firestore,auth,storage,functions
