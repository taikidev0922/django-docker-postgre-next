# ベースイメージの指定
FROM python:3.9

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    curl \
    docker-compose \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# 必要なパッケージのインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Gitをインストール
RUN apt-get update && apt-get install -y git

# プロジェクトのコピー
COPY . .

# Djangoの実行
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
