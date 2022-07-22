# アプリケーション名	

Camp Pro

# アプリケーション概要

キャンプを趣味とする人たちが所有するギアを共有することができる。キャンプ場以外でギアを見せる機会が少ないことから、新たなギアを購入するモチベーションにつながる。

# URL

http://3.115.190.100/

# テスト用アカウント

- Basic認証ID: admin
- Basic認証パスワード: 2222
- メールアドレス: test@test
- パスワード: a000000

# 利用方法

## 自分のギアを投稿

1. トップページのヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、ギアの内容(ギアの写真、カテゴリー、ブランド、モデル名等)を入力し投稿する

## 他人のギアにいいねやコメントをする

1. ギア一覧ページで他人のギアにいいねする
2. ギアの詳細ページで他人のギアにコメントする

# アプリケーションを作成した背景

キャンプ好きの間では「キャンプ沼」といわれる、キャンプにハマったキャンパーたちが沼にはまるかのように新たなギアを次々と買い揃えたりする様を表す言葉が存在する。また、キャンパーたちはそのギアをキャンプ場で披露するのが一般的だが、キャンプ場にわざわざ足を運ばなければ披露できないことと、キャンプ場で大きなギアは周りのキャンパーたちから注目を浴びることが容易だが小さなギアは遠目からなかなか見ることができないため、キャンプ場以外でカンタンにギアをお披露目する場所を作りたかった。

# 洗い出した要件

[要件定義シート](https://docs.google.com/spreadsheets/d/1u83LCa8YryC6_WjoxPqYiq-Pzm2UcP2lNVSwAP0dYdg/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

- ギアをカテゴリー毎、ブランド毎に登録できる
![ギア登録](https://user-images.githubusercontent.com/90191399/180391755-9e196521-e8c6-43be-a5d2-1884e0a0765f.gif)

- ギアに対していいね！(非同期通信)やコメントができる
![いいね](https://user-images.githubusercontent.com/90191399/180393886-5c4cc50c-8dbf-41bb-9a66-06e3ed0003fa.gif)

- 自分以外のユーザーをフォローできる
![フォロー](https://user-images.githubusercontent.com/90191399/180394136-fa95c06f-d90b-4d35-92fc-d5dec08a7c78.gif)

- ギアを検索できる
![ギア検索](https://user-images.githubusercontent.com/90191399/180394354-887fd5d3-b71d-4014-bed7-3bcfd48e5fdd.gif)


# 実装予定の機能

- SNS認証機能
- トップページでユーザーランキング等
- キャンパー熟練度等のゲーム要素

# データベース設計

![campfuel](https://user-images.githubusercontent.com/90191399/179888378-fbcee2b9-5c35-4a98-87b2-9ca5ad09e0c6.png)

# 画面遷移図

![campfuelpages](https://user-images.githubusercontent.com/90191399/179887850-69aa1b4d-ac8e-4acc-8d64-41ebc75fe363.png)

# 開発環境

- フロントエンド: HTML/CSS/JavaScript/JQuery/bootstrap
- バックエンド: Ruby/Rails
- インフラ: AWS(EC2/S3)
- テスト: RSpec
- テキストエディタ: VSCode
- タスク管理: GitHub

# ローカルでの動作方法

以下コマンドを順に実行<br>
% git clone https://github.com/troymich123/camp-pro.git<br>
% cd camp-pro<br>
% bundle install<br>
% yarn install

# 工夫したポイント

- bootstrapを利用したわかりやすいUI/UX、レスポンシブなデザイン
- 後から追加機能を実装しやすいようにrenderを活用しコードをなるべくシンプルにした
- ギアのカテゴリーやブランド一覧はキャンプ関連のメジャーなメディアからスクレイピングしてもってきた
- ユーザーに飽きさせないようスピード感をもつサイトを目指しJSや非同期通信をところどころ用いた