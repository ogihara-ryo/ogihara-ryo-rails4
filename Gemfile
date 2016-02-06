source 'https://rubygems.org'

# Ruby と rails のバージョンは最新でメンテナンスしたい
ruby '2.3.0'
gem 'rails', '4.2.5'

# Heroku にデプロイするため、ORDBMS に PostgreSQL を選択する
gem 'pg', '~> 0.15'

# スタイルシートに SCSS を使用する
gem 'sass-rails', '~> 5.0'

# JavaScript のホワイトスペースを削除したり、条件分岐を条件演算子に変更したりで圧縮する
# config/environments/production.rb の config.assets.js_compressor = :uglifier で活性
gem 'uglifier', '>= 1.3.0'

# テンプレートエンジンに slim を使用する
gem 'slim-rails'

# Assets と View で CoffeeScript を使用する
gem 'coffee-rails', '~> 4.1.0'

# JavaScript のエンジン V8 を Ruby から利用する
gem 'therubyracer', platforms: :ruby

# JavaScript のライブラリ jQuery を使用する
gem 'jquery-rails'

# ページの移動をAjaxに置き換えることで、JavaScriptやCSSの読み込みを省略して高速化する
gem 'turbolinks'

# 'annotate' コマンドで各ファイルに schema 情報などをコメントする
gem 'annotate'

group :development do
  # コーディングルールの準拠チェックを実施する
  gem 'rubocop'

  # ファイルの保存時に自動で rubocop を実行する
  gem 'guard-rubocop'

  # n + 1 問題を検出する
  gem 'bullet'

  # 例外ページにコンソールを設置し、View ファイルから console を呼ぶとコンソールを起動する
  gem 'web-console', '~> 2.0'

  # エラーページを強化する
  gem 'better_errors'

  # アセットパイプラインのログを表示しない
  gem 'quiet_assets'
end

group :development, :test do
  # rails c で起動する対話式コンソールを irb から pry に変更する
  gem 'pry-rails'

  # binding.pry コールした場所がブレークポイントとなる
  gem 'pry-byebug'

  # ファイルの保存時に自動で rspec を実行する
  gem 'guard-rspec'

  # ファイルシステムの変更イベントを監視する
  gem 'guard'

  # Guard に OS の通知センターを利用させる
  gem 'terminal-notifier-guard'

  # アプリケーションプリローダー
  gem 'spring'

  # RSpec を Spring 上で起動する
  gem 'spring-commands-rspec'

  # テストフレームワーク
  gem 'rspec-rails'

  # /.env に環境変数を定義する
  gem 'dotenv-rails'
end

group :test do
  # ユーザーとアプリケーションのやり取りをシミュレートする(フィーチャーテスト)
  gem 'capybara'

  # RSpec でのテストを強力にサポートしてくれるマッチャー集
  gem 'shoulda-matchers', require: false

  # コードのカバレッジを計測する
  gem 'simplecov', require: false

  # テスト時にデータベースを綺麗にする
  gem 'database_cleaner'
end
