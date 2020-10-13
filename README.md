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
- バリデーション
- テストを書く
- i18nの設定がなぜか反映されないので反映するように設定させたい
- ↑のせいで、エラーメッセージのモデル名が英語になってるので、日本語にする
- 表面について、未選択の場合、「画像を選択してください」と書いた画像を表示しようとする
- 使ってないパスの削除
- (必ず)特定のユーザーから、ライセンス登録(カードの登録)の総当たり攻撃を受けた際に、一定時間ペナルティを与える
- zipがダウンロード出来ない
- 将来的にはブラウザ上でストリーミング再生出来るようにしたいが、纏めてzipで音楽をダウンロードした場合の開き方・聞き方のマニュアルを作る(iphone android両方)
- HerokuようにProcfileを書く
- (バグ)ログイン後に正しく遷移しない時がある(再現する条件が不明)
- (バグ)active_storage_analysisのキューが無限に増える
- 音声データを削除した際、実行途中のジョブも強制終了させる

## いつか追加したい機能
- 感想やコメントを受け付け(ダウンロードページのコメントフォームを作って作品への感想やコメントを受け付け。対面販売ではなかなか拾うことのできないユーザー様の声をキャッチできます。)

### イラストを追加する機能
- 画像をスライドショー形式で表示する(slickを使う)

## Todoリスト(自分用)
- 利用規約の作成
