## 複数のアプリがミックスした repository でそれぞれを deploy する

### 動かし方

以下で yarn install する。

 * プロジェクトルート
 * rails
 * jekyll

これは ViteRuby が yarn workspace に対応していないため。

以下で bundle install する。

 * rails
 * jekyll

これは bundler に workspace 機能がないため。

### 目的

一つのリポジトリに以下の3つの仕組みを同居させたい。

 * サーバサイドフレームワークを利用したWebアプリ
 * 静的サイトジェネレータを利用したWebサイト
 * 以上二つに共通するアセットを管理する場所

そのうえでそれぞれ別々に deploy したい。

### 背景

静的な「コンテンツ」の比率が高く、すべて動的なフレームワークで実現するのではなく、必要に応じて分離することで以下を実現したい。

 * 動的サイトの開発と静的サイトの制作を分離することにより制作スピードの向上
 * リポジトリごと分かれてしまうとそれぞれの取り組みが見えにくくなる、共通のアセットを管理しにくくなるので一つに収めておく
 * 動的な部分と静的な部分でコミット粒度もレビューの粒度も異なるので運用基準を分ける
 * 静的サイトのホスティングと動的サイトのホスティングを分離し、それぞれのホスティングのメリットを十分に活用する

### 未解決

静的サイトだけ、動的サイトだけ deploy するのは今のところ考えていない。普通に設定すると同じリポジトリの default branch への push から自動的に両方のサイトが deploy されることを想定している。

### Rails x Heroku

複数のアプリがミックスしている場合、Heroku ではそのまま動かすことができない。そこで以下のステップを踏んで Docker Container として deploy する。

 0. rails-0-setup-builder
 1. rails-1-compile-app
 2. rails-2-deploy-to-heroku

これは今回のアプリが

 * frontend/
 * rails/

の両方に依存しているから。特定のディレクトリ以下にすべて収まっているなら heroku-buildpack-monorepo などで対応はできる。

### Jekyll x ?

 * Netlify であれば base directory を jekyll/ 以下にしてあげれば普通にビルドが通り、サイトを publish できる
 * Firebase であれば CloudBuild + Docker + firebase-tools で自由に build / deploy することができる
