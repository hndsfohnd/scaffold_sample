# README
## amadeusコマンド検索

## 概要
- 国際線フライト・海外ホテル予約端末システムであるアマデウス・インフィニ・アクセスのコード比較の登録と検索が行える。
- amadeusのコマンド問題登録と回答が行える。

## 本番環境
  - Herokuでのデプロイ　　https://amadeuscommandsearch.herokuapp.com/books

## 制作背景
 - 社内で利用していた予約端末システムであるインフィニとアクセスの代わりに、アマデウスを取り入れることになったため、弊社社員を対象に業務効率化を目的に作ったアプリである。（インフィニやアクセスのコマンドは覚えているが、アマデウスのコマンドがわからない際に検索をかけることができる）
 - 問題の作成・回答ができるため、他の便利なコマンドの共有や学ぶことができる。

## テーブル

searchテーブル
|Column|Type|Options|
|------|----|-------|
|amadeus|string|null: false|
|description|string|null: false|
|axess|string|
|infini|string|

bookテーブル
|Column|Type|Options|
|------|----|-------|
|question|string|null: false|
|answer|string|null: false|


## 工夫したポイント
 - ユーザビリティーを考え、AJAXを取り入れた実装を行った。（非同期通信・インクリメンタルサーチ機能）

## 開発環境
RAILS JQUERY (ruby2.5.1 rails5.2.4)

## 課題や今後実装したい機能
複数検索機能の追加
