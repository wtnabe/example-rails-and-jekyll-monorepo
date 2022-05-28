## 複数のアプリがミックスした repository をそれぞれ deploy する

### Rails x Heroku

複数のアプリがミックスしている場合、Heroku ではそのまま動かすことができない。そこで以下のステップを踏んで Docker Container として deploy する。

 0. rails-0-setup-builder
 1. rails-1-compile-app
 2. rails-2-deploy-to-heroku

これは今回のアプリが

 * frontend/
 * rails/

の両方に依存しているから。特定のディレクトリ以下にすべて収まっているなら heroku-buildpack-monorepo などで対応はできる。


