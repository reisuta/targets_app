# README

タスクは、githubのProjectsの実装に看板形式で貼ってあります。


**・環境構築**

dockerを起動

docker compose build

docker compose up -d

docker compose run web(※ここはコンテナ名) rails db:create && db:migrate

※コンテナを落とすときは、docker compose downを実行する

**・Docker上でコマンドを実行するやり方**

docker psで表示されたコンテナIDをコピーする

docker exec -it コンテナID /bin/bash

rspecやrubocopなど、実行したいコマンドを実行する

または、docker compose run web(※ここはコンテナ名) 実行したいコマンド

**・設計書**
[スプレッドシート](https://docs.google.com/spreadsheets/d/1nlH04f2f2Y7gG4bB0Kz1a7VKy5LLbqCtCyUZpbem9sU/edit#gid=0)
