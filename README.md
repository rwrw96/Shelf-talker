# ShelfTalker

## 概要
#### ShelfTalkerとは...  本アプリはCRUD処理を基盤とした映画レビューサイト  
<img width="80%" alt="ShelfTalker_gif" src="https://github.com/rwrw96/Shelf-talker/blob/readme/app/assets/images/ShelfTalker_gif6.gif">  
TMDbのAPIを使用して映画、キャスト情報を取得。  
ユーザーは気に入ったレビューを保存することで作品をブックマークすることが可能。  
マイページにお気に入りの映画を陳列することができます。

## サイト概要
<映画のレビューを書き込んで自分の”好き”を他ユーザーと共有し合うアプリです。ユーザーはレビューを見て面白そうだと感じたらそのレビューを保存することができます。映画の情報についてはTMDbのAPIを使用しています。> </br>
<今日本にある映画レビューサイトは１ページに情報が多く使いづらいと感じていたので、なるべくシンプルなデザインを意識して利便性をあげることにしました></br>
<width320pxにも対応しておりスマートフォンでも利用できるようになっています>

### サイトテーマ
<自分の”好き”を共有しよう！>

### テーマを選んだ理由
<TwitterやInstagramなど主流のSNSは多くの情報が飛び交っていて映画の情報だけ集めたい時に不便だと感じていた。また、日本の映画レビューサイトは見づらい部分がありもう少しシンプルなデザインなサイトが欲しかった>

### ターゲットユーザ
<年齢、性別問わず。映画が好きな者、他の人の好きな映画が知りたい者、自分の好きな映画を教えたい者>

### 主な利用シーン
<面白い映画に出会った時、誰かにそれを伝えたい時、自分用のメモとして、面白そうな映画を見つけたい時>

## 設計書
-テーブル定義書=> https://docs.google.com/spreadsheets/d/1UsjkKhIVXtB9PnCAEK7Vd1-GZrmUWdXkW_lXzY0Bxuo/edit#gid=0</br>
-アプリケーション詳細設計=> https://docs.google.com/spreadsheets/d/14Rikx16Nuci44hd96XxTP6Z8oM6dCLXFhRET6CUoZDY/edit#gid=0</br>
-ER図=> https://app.diagrams.net/#G1I006FXINbQOdTCJ8BpH3_jH6-LXL1cpQ

## チャレンジ要素一覧
<https://docs.google.com/spreadsheets/d/1EvaT_Lskz77sVSPdANoSPh19_rkRdEzevJ_vdld5fxI/edit#gid=0>

### 機能概要
<新規登録時、認証メールが送信され添付されているURLをクリックすると登録完了となります(それらの作業を飛ばしたゲストログイン機能もあります)></br>
<退会機能には論理削除を適用し、謝ってユーザーが削除されないようになっています></br>
<管理人ユーザーを真偽値で判断しており管理人は任意のユーザー、レビュー等を削除することができます></br>
<全てのレビューはヘッダーのREVIEWSから確認し、リンク先の詳細画面から保存することができます(保存したレビューされている映画はマイページから確認できます)>


## 開発環境
- OS：Linux2(CentOS)
- 言語：HTML,CSS
  - JavaScript
  - Ruby 2.6.3
  - SQL
- フレームワーク：Ruby on Rails 5.2.5
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- https://developers.themoviedb.org/3/getting-started/introduction　
-TMDb API
