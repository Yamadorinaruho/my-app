# ベースイメージを指定
FROM node:18-alpine

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとyarn.lockをコピー
COPY package.json yarn.lock ./

# 依存関係をインストール
RUN yarn install --frozen-lockfile

# 環境変数の確認
RUN echo "NODE_ENV is set to $NODE_ENV"

# アプリケーションのソースコードをコピー
COPY . .

# Next.jsアプリをビルド
RUN yarn build

# アプリケーションを起動
CMD ["yarn", "start"]
