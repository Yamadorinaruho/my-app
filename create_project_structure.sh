#!/bin/bash

BASE_DIR="/Users/yamadori/Desktop/my-app"

mkdir -p $BASE_DIR/backend/app/api/v1/endpoints
mkdir -p $BASE_DIR/backend/app/core
mkdir -p $BASE_DIR/backend/app/models
mkdir -p $BASE_DIR/backend/app/schemas
mkdir -p $BASE_DIR/backend/tests
mkdir -p $BASE_DIR/frontend/components
mkdir -p $BASE_DIR/frontend/pages/api
mkdir -p $BASE_DIR/frontend/public/images
mkdir -p $BASE_DIR/frontend/styles

touch $BASE_DIR/backend/app/api/v1/endpoints/init.py
touch $BASE_DIR/backend/app/api/v1/endpoints/user.py
touch $BASE_DIR/backend/app/api/v1/endpoints/item.py
touch $BASE_DIR/backend/app/api/v1/init.py
touch $BASE_DIR/backend/app/core/config.py
touch $BASE_DIR/backend/app/core/security.py
touch $BASE_DIR/backend/app/core/init.py
touch $BASE_DIR/backend/app/models/init.py
touch $BASE_DIR/backend/app/models/user.py
touch $BASE_DIR/backend/app/models/item.py
touch $BASE_DIR/backend/app/schemas/init.py
touch $BASE_DIR/backend/app/schemas/user.py
touch $BASE_DIR/backend/app/schemas/item.py
touch $BASE_DIR/backend/app/main.py
touch $BASE_DIR/backend/app/init.py
touch $BASE_DIR/backend/app/database.py
touch $BASE_DIR/backend/tests/init.py
touch $BASE_DIR/backend/tests/test_main.py
touch $BASE_DIR/backend/Dockerfile
touch $BASE_DIR/backend/requirements.txt
touch $BASE_DIR/backend/README.md

Next.jsページに有効なReactコンポーネントを追加
echo 'import React from "react";

const Home = () => {
return (
<div>
<h1>Welcome to Next.js!</h1>
</div>
);
};

export default Home;' > $BASE_DIR/frontend/pages/index.js

echo 'import React from "react";

const MyApp = ({ Component, pageProps }) => {
return <Component {...pageProps} />;
};

export default MyApp;' > $BASE_DIR/frontend/pages/_app.js

echo 'import React from "react";
import Document, { Html, Head, Main, NextScript } from "next/document";

class MyDocument extends Document {
render() {
return (
<Html>
<Head />
<body>
<Main />
<NextScript />
</body>
</Html>
);
}
}

export default MyDocument;' > $BASE_DIR/frontend/pages/_document.js

echo 'export default function handler(req, res) {
res.status(200).json({ message: "Hello from API!" });
}' > $BASE_DIR/frontend/pages/api/hello.js

touch $BASE_DIR/frontend/components/Layout.js
touch $BASE_DIR/frontend/components/Header.js
touch $BASE_DIR/frontend/components/Footer.js
touch $BASE_DIR/frontend/public/favicon.ico
touch $BASE_DIR/frontend/styles/globals.css
touch $BASE_DIR/frontend/styles/Home.module.css
touch $BASE_DIR/frontend/Dockerfile
touch $BASE_DIR/frontend/next.config.js
touch $BASE_DIR/frontend/package.json
touch $BASE_DIR/frontend/yarn.lock
touch $BASE_DIR/frontend/README.md

touch $BASE_DIR/.gitignore
touch $BASE_DIR/docker-compose.yml

backend/Dockerfileの内容
cat <<EOF > $BASE_DIR/backend/Dockerfile

ベースイメージ
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

作業ディレクトリ
WORKDIR /app

必要なファイルをコピー
COPY ./app /app

必要なパッケージをインストール
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
EOF

frontend/Dockerfileの内容
cat <<EOF > $BASE_DIR/frontend/Dockerfile

ベースイメージ
FROM node:18-alpine

作業ディレクトリ
WORKDIR /app

必要なファイルをコピー
COPY package.json yarn.lock ./

依存関係をインストール
RUN yarn install

残りのファイルをコピー
COPY . .

アプリケーションをビルド
RUN yarn build

Next.jsサーバを起動
CMD ["yarn", "start"]
EOF

docker-compose.ymlの内容
cat <<EOF > $BASE_DIR/docker-compose.yml
version: '3.8'

services:
backend:
build:
context: ./backend
dockerfile: Dockerfile
container_name: backend
ports:
- "8000:80"
volumes:
- ./backend/app:/app

frontend:
build:
context: ./frontend
dockerfile: Dockerfile
container_name: frontend
ports:
- "3000:3000"
volumes:
- ./frontend:/app
environment:
- NODE_ENV=development
command: yarn dev
EOF

echo "プロジェクトフォルダ構造とDocker設定が作成されました。"

