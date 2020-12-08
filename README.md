# ShareCards
自宅で簡単にダウンロードカード作成！  
※試用の為のアカウントを作成しました。下記に記載しています。

## URL
https://www.share-cards.com/

## 概要
音楽やイラストなどのダウンロードできる機能を有したカード(ダウンロードカード)を、作成できると言うサービスになっております。
音楽や絵などのクリエイターが自らのデジタルデータの創作物を、同人即売会(コミケ)などのイベントで販売する為に作成しました。  
紹介画像  
![ShareCardsについて](https://user-images.githubusercontent.com/61904065/101494180-577d8700-39aa-11eb-8266-38b8656a0f6f.png)

## 試用アカウント
email:shugoena.shuukatu☆gmail.com  
☆を@に変えてください  
password:shug☆123  
☆をoに変えてください  

## 使い方
・クリエイター側
https://www.share-cards.com/use_make_card

・視聴者側
https://www.share-cards.com/use_card

## ER図
レポジトリー内のerb.pdf参照

## 使用技術
- Ruby
- Ruby on Rails
- Postgres
- Active Strage
- AWS S3
- Redis
- Sidekiq
- ffmpeg
- Heroku
![image](https://user-images.githubusercontent.com/61904065/98067492-022af300-1e9d-11eb-91ee-c691a431a5dc.png)

# ローカルでの環境構築
### バージョン情報
Railsバージョン：Rails 6.0.3.3  
Ruby：ruby 2.6.6  

### ローカルでの環境構築手順
#### インストールが必要なもの
- Ruby(rbenv推奨)
- Ruby on Rails
- FFmpeg
- Redis
- Postgres

#### 最初の起動時にする事
環境変数の設定が必要  
.envのファイルを貰ってアプリ直下に入れる。

#### 起動手順
Redisの立ち上げ
```
$ redis-server
```

Sidekiqの立ち上げ
```
$ bundle exec sidekiq
```

Railsの立ち上げ
```
$ rails s
```

### herokuの場合の環境構築(書きかけ)
heroku config:set MALLOC_ARENA_MAX=2

---
## こだわった点
### Ruby
- 非同期処理によりwavファイルをmp3,flacに自動変換
- メタ情報を変換時に自動入力
- PDF自動生成(付随してシリアルコードが内蔵されたQRや、シリアルコード自動生成)
- シリアルコードはハッシュにより、連番を防ぎ不正アクセス防止
- 音楽ファイルを自動的にzipにまとめてダウンロードする機能
- aws S3をCORSにより利用し、ダイレクトアップロードを実現。ユーザー体験の向上。

### JavaScript
- カードを作る際にプレビューをサイト内に表示(プレビューはローカルのファイルを参照することにより、リアルタイム性を重視)
- ブラウザからカメラを起動しQR読み取りする機能(シリアルコードの入力手間を削減)
- ブラウザ上で音楽再生機能を設置

### HTML
- 利用者が安心出来ることを目指し、青基調にしました。

### インフラ
- gitとherokuとslackを同期させ、スムーズにデプロイ
- ステージング環境を用意

### ダウンロードカード出力サンプル（表面）
![image](https://user-images.githubusercontent.com/61904065/101498768-d628f300-39af-11eb-8f70-a9a2978255c1.png)

### ダウンロードカード出力サンプル（裏面）
![image](https://user-images.githubusercontent.com/61904065/101498576-9a8e2900-39af-11eb-8d22-a73ee1ebee47.png)

## いつか追加したい機能
- 感想やコメントを受け付け

### イラストを追加する機能
- 画像をスライドショー形式で表示する(slickを使う)
