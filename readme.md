# SvelteKit と Firebase を利用したアプリのテンプレート

このプロジェクトは、SvelteKit と Firebase を組み合わせた開発環境のテンプレートです。

Docker Compose ですぐに開発環境を構築できます。

## 必要なツール

以下のツールをインストールしてください。

- Docker

- Node.js

- Firebase CLI

## Docker コンテナの起動：

1. `firebase`ディレクトリに移動します。

  ```bash
  cd firebase
  ```

2. Firebase を初期化します

  ```bash
  firebase init
  ```

3. `firebase.json`の`ui`プロパティを以下のように設定します。

  ```json
      "ui": {
        "host": "0.0.0.0",
        "enabled": true,
        "port": 4000
      },
  ```

そして、以下のコマンドを実行して、Firebase エミュレーターと SvelteKit アプリを起動します。

```bash
docker compose up　--build
```

コンテナが起動すると、以下のサービスが利用可能になります。

| サービス名              | URL                    |
| ----------------------- | ---------------------- |
| SvelteKit アプリ        | https://localhost:5173 |
| Firebase エミュレーター | http://127.0.0.1:4000  |

## 開発フロー

1. **SvelteKit アプリの開発**

通常の SvelteKit プロジェクトと同じように、`src/` フォルダ内のファイルを編集してください。

ホットリロードが有効になっているため、変更を保存すると自動的にリロードされます。

2. **Firebase エミュレーターの利用**

Firestore や Authentication のテストをローカルで行う際は、エミュレーターを活用してください。

管理画面は [http://localhost:4000](http://localhost:4000) で確認できます。

## 本番環境を起動する

本番環境を起動する場合は、`docker-compose.yml のみを使用します。

```bash
docker compose -f docker-compose.yml up --build
```

## ライセンス

このプロジェクトは MIT ライセンスのもとで提供されています。
