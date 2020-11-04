# ShareCards
自宅で簡単にダウンロードカード作成！

## URL
https://www.share-cards.com/

## 概要
音楽やイラストなどのダウンロードできる機能を有したカード(ダウンロードカード)を、作成できると言うサービスになっております。
音楽や絵などのクリエイターが自らのデジタルデータの創作物を、同人即売会(コミケ)などのイベントで販売する為に作成しました。

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
## Todoリスト
- 使ってないパスの削除
- 特定のユーザーから、ライセンス登録(カードの登録)の総当たり攻撃を受けた際に、一定時間ペナルティを与える
- zipでダウンロードした場合の開き方・聞き方のマニュアルを作る(iphone android両方)
- ログイン後に正しく遷移しない時がある(再現する条件が不明)
- 音声データを削除した際、実行途中のジョブも強制終了させる

## いつか追加したい機能
- 感想やコメントを受け付け

### イラストを追加する機能
- 画像をスライドショー形式で表示する(slickを使う)
