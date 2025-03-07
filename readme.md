# SvelteKit と Firebase を利用したアプリのテンプレート

このプロジェクトは、SvelteKit と Firebase を組み合わせた開発環境のテンプレートです。

Docker Compose ですぐに開発環境を構築できます。

## 必要なツール

以下のツールをインストールしてください。

- Docker

- Node.js

- Firebase CLI

## Docker コンテナの起動：

1. `/firebase`ディレクトリへ移動します。

   ```bash
   cd firebase
   ```

2. Firebase を初期化します。

   ```bash
   firebase init
   ```

3. Firebase のコンソールから取得できるサービスアカウントキーを`/firebase`ディレクトリに入れます。

4. 以下のコマンドを実行して、Firebase エミュレーターと SvelteKit アプリを起動します。

   ```bash
   docker compose up --build --watch
   ```

コンテナが起動すると、以下のサービスが利用可能になります。

| サービス名              | URL                    |
| ----------------------- | ---------------------- |
| SvelteKit アプリ        | https://localhost:5173 |
| Firebase エミュレーター | http://127.0.0.1:4000  |

## 開発する

- **SvelteKit アプリの開発**

  通常の SvelteKit プロジェクトと同じように、`app` フォルダ内のファイルを編集してください。

  ホットリロードが有効になっているため、変更を保存すると自動的にリロードされます。

- **Firebase エミュレーターの利用**

  Firestore や Authentication のテストをローカルで行う際は、エミュレーターを活用してください。

  管理画面は [http://localhost:4000](http://localhost:4000) で確認できます。

- **Firebase functions でバックエンドを作る**

  `firebase/functions`ディレクトリもホットリロードが有効になっており、`src`以下のファイルを編集すると、自動的にエミュレーターが再起動し、functions の関数が更新された状態となります。

## 本番環境を起動する

本番環境のアプリを起動する場合は、`docker-compose.yml` のみを使用します。

本番環境のアプリは`3000`で起動し、また、functionsは、`1231`で起動します。

```bash
docker compose -f docker-compose.yml up --build
```

## ライセンス

このプロジェクトは MIT ライセンスのもとで提供されています。
