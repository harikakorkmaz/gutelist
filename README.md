# ぐてリスト  
# https://gutelist.com
翻訳機能付タスク管理アプリ

## サイト概要
日本語で入力されたタスクを自動翻訳によって英語で表示するサイトです。
作成したタスクは、重要度に応じて自動で色分けされます。
一見では英語版のみ表示されますが、詳細&編集画面から日本で入力された情報も見ることができます。
TOPページには、未完了タスクと本日の完了済タスクが表示されます。
カレンダーから今までのタスク完了状況を目視でわかりやすく確認することができます。
完了済タスクページから過去のタスクを確認することができます。
ユーザーのプロフィールやアクティビティを閲覧でき、フォローすることができます。
タスク完了数に応じてランキングが表示されます。

### サイトテーマ
英語を自分事に。

何年も英語に触れているのに苦手意識が抜けない、上達しない。
それは、英語を他人事にしているからではないでしょうか。
自分事であるタスク管理に英語を取り入れて、英語を身近なものにしていきませんか？

### 名前の由来
Get used to English(英語に慣れる)の頭文字をとりました。

### ターゲットユーザ
英語を身近なものにしたい人

### 主な利用シーン
日常生活でのタスク管理

## 設計書
https://docs.google.com/spreadsheets/d/1O3AOfP5oadgQrJuhIVwjtAyP99fvGPkwEegb1Hu2dPE/edit#gid=1287297668

### 機能一覧
- ユーザー認証(devise)
- 翻訳機能(Google Apps Script)
- 翻訳機能の非同期通信(Ajax)
- フォロー機能
- カレンダー機能(simple_calendar)
- 画像アップロード機能(Refile)
- 画像プレビュー機能(jQuery)
- テスト(Rspec)
- HTTPS化(AWS)
- 自動デプロイ(Github Actions)
- Google Natural Language API
- レスポンシブ対応(Flexbox)

https://docs.google.com/spreadsheets/d/1yOyAfTLTmr4cLwHEWo-rbx8XJXJy-hTj_RBrnoiZEc8/edit#gid=705990360

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
