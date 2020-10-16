# ShareCards
自宅で簡単にダウンロードカード作成！

## URL
https://www.share-cards.com/

## 概要
音楽やイラストなどのダウンロードできる機能を有したカード(ダウンロードカード)を、作成できると言うサービスになっております。

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


# ローカルでの環境構築
### バージョン情報
Railsバージョン
Rails 6.0.3.3
ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]

### ローカルでの環境構築手順
#### 一度のみ
環境変数
```
.envのファイルをもらう
```

ffmpegのインストール
```
<!-- macの場合 -->
brew install ffmpeg
```

#### 毎回
Gitを更新とDB更新
```
git checkout master
git pull
rails db:migrate

<!-- エラーが出た場合 -->
rails db:reset
rails db:migrate
```

Redisの立ち上げ
```
redis-server
```

Sidekiqの立ち上げ
```
bundle exec sidekiq
```

Railsの立ち上げ
```
rails s
```

### herokuの場合の環境構築(書きかけ)
heroku config:set MALLOC_ARENA_MAX=2

---
## Todoリスト
- テストを書く
- 使ってないパスの削除
- (必ず)特定のユーザーから、ライセンス登録(カードの登録)の総当たり攻撃を受けた際に、一定時間ペナルティを与える
- zipでダウンロードした場合の開き方・聞き方のマニュアルを作る(iphone android両方)
- (バグ)ログイン後に正しく遷移しない時がある(再現する条件が不明)
- 音声データを削除した際、実行途中のジョブも強制終了させる
- 利用規約の作成

## いつか追加したい機能
- 感想やコメントを受け付け

### イラストを追加する機能
- 画像をスライドショー形式で表示する(slickを使う)
