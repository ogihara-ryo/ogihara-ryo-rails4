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

# Assets と View で CoffeeScript を使用する
gem 'coffee-rails', '~> 4.1.0'

# JavaScript のエンジン V8 を Ruby から利用する
# gem 'therubyracer', platforms: :ruby

# JavaScript のライブラリ jQuery を使用する
gem 'jquery-rails'

# ページの移動をAjaxに置き換えることで、JavaScriptやCSSの読み込みを省略して高速化する
gem 'turbolinks'

# 'annotate' コマンドで各ファイルに schema 情報などをコメントする
gem 'annotate'

group :development do
  # n + 1 問題を検出する
  gem 'bullet'

  # 例外ページにコンソールを設置し、View ファイルから console を呼ぶとコンソールを起動する
  gem 'web-console', '~> 2.0'

  # エラーページを強化する
  gem 'better_errors'

  # アセットパイプラインのログを表示しない
  gem 'quiet_assets'

   # アプリケーションプリローダー
  gem 'spring'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end
