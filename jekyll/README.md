## 一つ上の階層にViteで処理するコードを置いたJekyll

### この環境の作り方

 1. jekyll new
 2. add jekyll-vite plugin
 3. source を src/ に設定し、一貫して実現できるように Rakefile を用意
 4. bundle exec vite install
 5. できあがった ./exe/dev 内の overmind を foreman に変更し、Procfile.dev からも rake で上で設定した build task を呼ぶように
 6. vite.config.ts に以下の設定を追加し、上の階層を扱えるように

```json
   "server": {
    "fs": {
      "allow": ["../"]
    }
  }
``

### 作業方法

```
./exe/dev
```

### build方法

```
bundle exec rake build
```

see [Deployment 🚀 · Jekyll ➕ Vite\.js](https://jekyll-vite.netlify.app/posts/deployment/)

jekyll-vite がいい具合に処理してくれるので、特に気にすることはない。
