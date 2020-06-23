# README

# Ruby On Rails 5 アプリケーションプログラミング

## 2 章

1. app/controllers/hello_controller.rb の作成
1. app/views/hello/special.html.erb の作成
1. O/R マッパーについて
   > O/R マッパーとはリレーショナルデータベースとオブジェクト指向言語との橋渡しを受け持つライブラリのこと。
   > O/R マッパーである Active Record を利用することで、Rails ではリレーショナルデータベース（表形式のデータ）をあたかもオブジェクトであるかのように操作できるようにる。また基本的には SQL 命令を記述する必要はなくなる。SQL には往々にしてデータベース製品固有の方言が存在する(オラクル、postgress、mysql)が、O/R マッパーはそれらを内部的に吸収してくる。そうすることで、接続先のデータベースを変更した場合にもアプリへの影響は最小限 に抑えられる
1. database.yml
1. rails g model model book isbn:string title:string price:integer publish:string published:date dl:boolean
1. 上記コマンドによる db/migrate/20200607164353_create_books.rb と app/models/book.rb、test/models/book_test.rb、test/fixtures/books.yml の作成
1. test/fixtures/books.yml にサンプルを添付
1. docker-compose run web rails dbconsole がうまく通らず Couldn't find database client: mysql, mysql5. Check your \$PATH and try again.というエラーをずっと吐くので、調べると default-mysql-client を Dockerfile にいれたことで解決
1. MySQL でのコマンド一覧

- show tables;　でテーブル一覧の表示
  +---------------------------+
  | Tables_in_app_development |
  +---------------------------+
  | ar_internal_metadata |
  | books |
  | schema_migrations |
  +---------------------------+
- show databases; データベースの一覧
  +--------------------+
  | Database |
  +--------------------+
  | information_schema |
  | app_development |
  | app_test |
  | mysql |
  | performance_schema |
  | sys |
  +--------------------+
- テーブル構造の確認 show columns from books;
  +------------+--------------+------+-----+---------+----------------+
  | Field | Type | Null | Key | Default | Extra |
  +------------+--------------+------+-----+---------+----------------+
  | id | bigint(20) | NO | PRI | NULL | auto_increment |
  | isbn | varchar(255) | YES | | NULL | |
  | title | varchar(255) | YES | | NULL | |
  | price | int(11) | YES | | NULL | |
  | publish | varchar(255) | YES | | NULL | |
  | published | date | YES | | NULL | |
  | dl | tinyint(1) | YES | | NULL | |
  | created_at | datetime | NO | | NULL | |
  | updated_at | datetime | NO | | NULL | |
  +------------+--------------+------+-----+---------+----------------+
  9 rows in set (0.002 sec)

- books テーブルの内容を確認 select \* from books;
  +----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
  | id | isbn | title | price | publish | published | dl | created_at | updated_at |
  +----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
  | 1 | 978-4-7741-8411-1 | 改訂新版 JavaScript 本格入門 | 2980 | 技術評論社 | 2016-09-30 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 2 | 978-4-7980-4803-1 | はじめての JSP&サーブレット 第 2 版 | 2800 | 秀和システム | 2016-09-27 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 3 | 978-4-7741-8030-4 | Java ポケットリファレンス | 2680 | 技術評論社 | 2016-03-18 | 1 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 4 | 978-4-8222-9876-0 | アプリを作ろう！ Visual C++入門 | 2000 | 日経 BP 社 | 2016-06-22 | 1 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 5 | 978-4-8222-9644-5 | アプリを作ろう！ Android 入門 | 2000 | 日経 BP 社 | 2015-08-21 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 6 | 978-4-7981-3547-2 | 独習 PHP 第 3 版 | 3200 | 翔泳社 | 2016-04-08 | 1 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 7 | 978-4-7741-7984-1 | Swift ポケットリファレンス | 2780 | 技術評論社 | 2016-03-04 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 8 | 978-4-7981-4102-2 | プログラマのための Docker 教科書 | 3000 | 翔泳社 | 2015-11-19 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 9 | 978-4-7741-7568-3 | AngularJS アプリケーションプログラミング | 3700 | 技術評論社 | 2015-08-19 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  | 10 | 978-4-7981-4402-3 | 独習 ASP.NET 第 5 版 | 3800 | 翔泳社 | 2016-01-21 | 0 | 2020-06-07 17:14:33 | 2020-06-07 17:14:33 |
  +----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
  10 rows in set (0.001 sec)

* quit で抜ける。

1. list アクションと list.html.erb ファイル、list へのルーティングを作成

1. rails server -e production で本番環境を指定して、本番環境の動作を確認できる

1. rails の環境設定

![IMG_0055](https://user-images.githubusercontent.com/51355545/84167200-e1f33580-aab0-11ea-88f7-381e5e7a23ef.jpeg)

![IMG_0056](https://user-images.githubusercontent.com/51355545/84167211-e3bcf900-aab0-11ea-9d4a-a491002b8a91.jpeg)

1. アプリ固有の設定定義で/config 下に my_config.yml と config/initializers/my_config.rb を作成
   **ただしいまいちこの設定は意味がわかっていない。**

# 3 章 scaffolding 機能

- 一度 book モデルを削除し、scaffold で作成したのだが migrate がつくられなかたった。原因は sql が削除できていなかったから。なので rails db して sql を開き、show tables;で一覧をだして、book を削除。drop table books;で戻って migration したら上手くいった。

* link_to メソッドに data-confirm オプションを指定するとリンククリック時に確認ダイアログを表示させられる。

<%= link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' } %><

- @book = Book.new new アクションはフォームから入力された情報を格納するための器を用意する

- params.require(:book).permit(:isbn, :title, :price, :publish, :published, :dl) ポストデータを取得 実際には以下のようなハッシュを取得している

{
"isbn" => "789067890",
"title" => "本のタイトル",
"price" => "1000",
"published(1i)" => "2020",
"published(2i)" => "01",
"published(3i)" => "10",
"dl" => "0"
}

- データ保存と結果に応じた処理の分岐
  ![IMG_2BA6B08089FA-1](https://user-images.githubusercontent.com/42993429/85420330-04f01000-b5ae-11ea-9ea1-5024e060af51.jpeg)

- update アクションのと save アクションの大きな違いは@book.update(book_params)と@book.save で book_params があるかないか。
  update 処理後の分岐
  ![IMG_82A2D68FEE6A-1](https://user-images.githubusercontent.com/42993429/85421435-5fd63700-b5af-11ea-8a4d-e720f98a3a7a.jpeg)

## 今後のモデル図

![hpBdv19tRuKIGlIkGc7HCg_thumb_47](https://user-images.githubusercontent.com/42993429/85422779-ef301a00-b5b0-11ea-8be8-172fadd644a0.jpg)
![PA4gGxcZTXmcxg0ZdrcUvA_thumb_45](https://user-images.githubusercontent.com/42993429/85422808-f8b98200-b5b0-11ea-9de1-7067226a72c8.jpg)
![XGxTMUcQQ7CzO0EqZM2LHw_thumb_48](https://user-images.githubusercontent.com/42993429/85423067-39b19680-b5b1-11ea-83fb-f00f3889b15b.jpg)

## ひたすらモデルの作成

- docker-compose run web rails g migration CreateJoinTableAuthorBook aouthor book
- docker-compose run web rails g scaffold user username:string password_digest:string email:string dm:boolean roles:string reviews_count:integer
- docker-compose run web rails g scaffold author user:references name:string birh:date address:text ctype:string photo:binary
- docker-compose run web rails g scaffold review book:references user:references status:integer body:text
- docker-compose run web rails g scaffold fan_comment author_no:integer name:string body:string deleted:boolean
- docker-compose run web rails g model memo memoable:references{polymorphic} body:string --fixture==false
