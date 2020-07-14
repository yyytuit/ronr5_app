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

# ビュー開発

- フォーム関連のビューヘルパー
  ![スクリーンショット 2020-06-27 1 28 09](https://user-images.githubusercontent.com/51355545/85879800-f015b580-b815-11ea-99b2-88c77cb69b9f.png)

- フォームヘルパーの分類
  ![スクリーンショット 2020-06-27 1 34 04](https://user-images.githubusercontent.com/51355545/85880083-65818600-b816-11ea-9334-1915de13251a.png)

- form_for は特定のモデルオブジェクトを編集するのに特化したメソッド
- form_tag はモデルに関係しない汎用的なフォームを生成するためのメソッド

## form_tag メソッド

- 検索キーワードや条件入力する検索フォームなど
  ![スクリーンショット 2020-06-27 1 44 11](https://user-images.githubusercontent.com/51355545/85881095-0faddd80-b818-11ea-9bde-9da4497c2d2f.png)
  ![スクリーンショット 2020-06-27 1 44 21](https://user-images.githubusercontent.com/51355545/85881104-12103780-b818-11ea-9b68-243f8b945d42.png)

* 例
  ![スクリーンショット 2020-06-27 1 49 04](https://user-images.githubusercontent.com/51355545/85881456-982c7e00-b818-11ea-84c5-ff1bc9a075e2.png)

```ruby
<%= form_tag( action: :create) do %>
  <div class ="field">
    <%= label :book, :isbn %><br/>
    <%= text_field :book, :isbn, size: 25 %>
  </div>
  <div class ="field">
    <%= label :book, :title %><br/>
    <%= text_field :book, :title, size: 25 %>
  </div>...中略
 <% end %>
```

```ruby
def form_tag
  @book = Book.new
end
```

## form_for ヘルパー

```ruby
<%= form_for(@book) do |f| %>
  <div class="field">
    <%= f.label :isbn %>
    <%= f.text_field :isbn, size: 25 %>
  </div>

  <div class="field">
    <%= f.label :title %>
    <%= f.text_field :title, size: 25 %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>
```

![スクリーンショット 2020-06-27 2 34 32](https://user-images.githubusercontent.com/51355545/85885132-cc0aa200-b81e-11ea-9787-c3f6ad36f1eb.png)
![スクリーンショット 2020-06-27 2 34 42](https://user-images.githubusercontent.com/51355545/85885141-cf059280-b81e-11ea-92f9-849b8afc749f.png)

## xxxx_field, text_area, radio_button, check_box

- テキストボックス

```ruby
<%= f.text_field :isbn, size: 20, maxlength: 25, readonry: true %>
```

< input size="20" maxlength="25" readonly="readonly" type="text" name="book[isbn]" id ="book\_ isbn"/>

- パスワードボックス

```ruby
<%= f.password_field :isbn, size: 10, maxlength: 15, disabled: true %>
```

< input size="10" maxlength="15" disabled="disabled" type="password" name="book[isbn]" id="book_isbn"/>

- テキストエリア

```ruby
<%= f.text_area :isbn, cols: 40, rows: 10 %>
```

< textarea cols="40" rows="10" name="book[isbn]" id="book_isbn">

- ラジオボタン

```ruby
<label><%= f.radio_button :publish, '技術評論社', class: :rd %>技術評論社</label>
```

<label>< input class="rd" type="radio" value="技術評論社" name="book[publish]" id="book*publish*"/>技術評論社</label>

- チェックボックス

```ruby
<label><%= f.check_box :dl, { class: 'chk'}, 'yes', 'no' %>ダウンロードあり?</label>
```

<label>< input name =" book[ dl]" type =" hidden" value =" no" /><input class="chk" type="checkbox" value="yes" name="book[dl]" id="book_dl"/> ダウンロードサンプルあり？ </label >

- ファイル入力ボックス

```ruby
<%= f.file_field :isbn, size: 10, maxlength: 15 %>
```

< input size="10" maxlength="15" type="file" name="book[isbn]" id="book_isbn"/>

- 隠しフィールド

```ruby
<%= f.hidden_field :isbn %>
```

< input type="hidden" name="book[isbn]" id="book_isbn"/>
<img width="803" alt="スクリーンショット 2020-06-27 3 22 55" src="https://user-images.githubusercontent.com/51355545/85889829-2e67a080-b827-11ea-80c2-7604cd7bd293.png">

## その他の

![スクリーンショット 2020-06-27 3 34 31](https://user-images.githubusercontent.com/51355545/85889824-2c054680-b827-11ea-9ac6-b45e2c065072.png)

- 色選択ボックス

```ruby
<%= f.color_field :isbn %>
```

< input value="#000000" type="color" name="book[isbn]" id="book_isbn"/>

- 日付入力ボックス

```ruby
<%= f.date_field :published %>
```

< input type="date" name="book[published]" id="book_published"/>

- 時刻入力ボックス

```ruby
<%= f.time_field :published %>
```

< input type="time" name="book[published]" id="book_published"/>

- 日付時刻入力ボックス

```ruby
<%= f.datetime_field :published %>
```

< input type="datetime-local" name="book[published]" id="book_published"/>

- 日付時刻入力ボックス(ローカル)

```ruby
<%= f.datetime_local_field :published %>
```

< input type="datetime-local" name="book[published]" id="book_published"/>

- 月入力ボックス

```ruby
<%= f.month_field :published %>
```

< input type="month" name="book[published]" id="book_published"/>

- 週入力ボックス

```ruby
<%= f.week_field :published %>
```

< input type="week" name="book[published]" id="book_published"/>

- メール入力ボックス

```ruby
<%= f.email_field :isbn, size: 25, maxlength: 30 %>
```

< input size="25" maxlength="30" type="email" name="book[isbn]" id="book_isbn"/>

- 数値入力ボックス

```ruby
<%= f.number_field :price, min: 10, max: 10000, step: 30 %>
```

< input min="10" max="10000" step="10" type="number" name="book[price]" id="book_price"/>

- スライダー

```ruby
<%= f.range_field :price, min: 0, max: 10000 %>
```

< input min="0" max="10000" type="range" name="book[price]" id="book_price"/>

- 検索ボックス

```ruby
<%= f.search_field :isbn, size: 10, maxlength: 15 %>
```

< input size="10" maxlength="15" type="search" name="book[isbn]" id="book_isbn"/>

- 電話番号入力ボックス

```ruby
<%= f.telephone_field :isbn, size: 15, maxlength: 20 %>
```

< input size="15" maxlength="20" type="tel" name="book[isbn]" id="book_isbn"/>

- URL 入力ボックス

```ruby
<%= f.url_field :isbn, size: 10, maxlength: 15 %>
```

< input size="10" maxlength="15" type="url" name="book[isbn]" id="book_isbn"/>
<img width="275" alt="スクリーンショット 2020-06-27 4 05 42" src="https://user-images.githubusercontent.com/51355545/85892224-80122a00-b82b-11ea-8763-fc795a49e522.png">

![スクリーンショット 2020-06-27 4 07 21](https://user-images.githubusercontent.com/51355545/85892335-ba7bc700-b82b-11ea-94c0-59b930395f27.png)

## FormTag ヘルパー

![スクリーンショット 2020-06-27 4 10 53](https://user-images.githubusercontent.com/51355545/85892621-370ea580-b82c-11ea-8681-f5b7165010fa.png)

xxxxx_field_tag は、 text_field_tag、 password_field_tag、 file_field_tag、 hidden_field_tag、 email_field_tag、 number_field_tag、 range_field_tag、 search_field_tag、 telephone_field_tag、 url_field_tag、 color_field_tag、 month_field_tag、 week_field_tag、 date_field_tag、 time_field_tag、 datetime_field_tag、 datetime_local_field_tag

## 選択ボックス

![スクリーンショット 2020-06-27 4 47 11](https://user-images.githubusercontent.com/51355545/85895265-53f9a780-b831-11ea-8a64-e8099d21856a.png)
![スクリーンショット 2020-06-27 4 47 16](https://user-images.githubusercontent.com/51355545/85895271-578d2e80-b831-11ea-8af2-7e6b87d5a7ba.png)

- 動作確認
  <img width="169" alt="スクリーンショット 2020-06-27 21 36 30" src="https://user-images.githubusercontent.com/51355545/85922449-49d1ba80-b8be-11ea-982c-d81df345f876.png">

<form class="new_book" id="new_book" action="/books" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="sVa9XT1CSmwapTWZ4tQRNKdDebFYF9Qn3AuaXp6/DgOtbRhIU1nQTan+XBIGGam8/TMdY3kF5qoKYWy19x+bsA==">
<select class="pub" name="book[publish]" id="book_publish"><option value="">選択してください</option>
<option value="技術評論家">技術評論家</option>
<option value="翔泳社">翔泳社</option>
<option value="日経BP社">日経BP社</option></select>
<br>
<select name="book[publish]" id="book_publish"><option value="1">技術評論社</option>
<option value="2">翔泳社</option>
<option value="3">日経BP社</option></select>
<br>
<select name="book[publish]" id="book_publish"><option value="1">技術評論社</option>
<option value="2">翔泳社</option>
<option value="3">日経BP社</option></select>
<br>
<input name="book[publish][]" type="hidden" value=""><select multiple="multiple" name="book[publish][]" id="book_publish"><option value="">選択してください</option>
<option selected="selected" value="技術評論社">技術評論社</option>
<option value="翔泳社">翔泳社</option>
<option value="日経BP社">日経BP社</option></select>
</form>

## collection_select メソッド

option 要素の情報をデータベースの値をもとに生成する
select メソッドと異なるのは、引数 collection,value,text の部分。
引数 collection で<option>要素のもととなるオブジェクト配列を渡し、引数 value と text でどの列を value 属性やテキストをして割り当てるかを指定する。

![スクリーンショット 2020-06-27 21 46 26](https://user-images.githubusercontent.com/51355545/85922609-b0a3a380-b8bf-11ea-943f-97a74cf0b3bc.png)

<img width="127" alt="スクリーンショット 2020-06-27 22 02 58" src="https://user-images.githubusercontent.com/51355545/85922963-0c6f2c00-b8c2-11ea-9d8b-6166ab966c07.png">

## group_collection_select メソッド

選択ボックスで<optgroup>要素を利用し選択肢をグループで分類できる。選択肢が多い場合はグループ化することで選択ボックスが見やすく、また選びやすくある
grouped_collection_select メソッドを利用するには関連するテーブルと対応するモデル、関連(アソシエーション)が必要。

![スクリーンショット 2020-06-27 22 14 47](https://user-images.githubusercontent.com/51355545/85923144-a5eb0d80-b8c3-11ea-9115-f249f53ad0c5.png)

![スクリーンショット 2020-06-27 22 14 24](https://user-images.githubusercontent.com/51355545/85923146-a84d6780-b8c3-11ea-81e4-8573724b1b93.png)

- undefined method `books' for #<Author:0x00007f33a5579b00>のエラーがでる ActionView::Template::Error (undefined method`books' for #<Author:0x00007f33a5579b00>):
  1: <%= form_for(@review) do |f| %>
  2: <%= f.grouped_collection_select :book_id, @authors, :books, :name, :id, :title %>
  3: <% end %>
  https://qiita.com/ayies128/items/9d73136f8f3bb9f59b8c
  上記サイトを見ておそらく has_many が必要なのかと考えたが、それもだめ。
  それで、実際の実装サンプルを確認したら has_and_belongs_to_many が使われていた
- has_and_belongs_to_many
  これは多対多で使う関連付け

* https://railsguides.jp/association_basics.html#has-and-belongs-to-many%E9%96%A2%E9%80%A3%E4%BB%98%E3%81%91
  <img width="308" alt="スクリーンショット 2020-06-27 23 16 57" src="https://user-images.githubusercontent.com/51355545/85924288-5230f200-b8cc-11ea-82e5-dcbbce1dac39.png">
  ![スクリーンショット 2020-06-27 23 27 25](https://user-images.githubusercontent.com/51355545/85924533-ecde0080-b8cd-11ea-8f05-e7b76db4cd2e.png)
  ![スクリーンショット 2020-06-27 23 27 31](https://user-images.githubusercontent.com/51355545/85924514-ce780500-b8cd-11ea-953c-8c0ce46a263d.png)

## モデルと関連付かない選択ボックスを生成する-select_tag メソッド

![スクリーンショット 2020-06-27 23 31 24](https://user-images.githubusercontent.com/51355545/85924602-5fe77700-b8ce-11ea-9573-ac7999616bd8.png)
![スクリーンショット 2020-06-27 23 31 36](https://user-images.githubusercontent.com/51355545/85924610-64139480-b8ce-11ea-958f-f06f7d8d7c6e.png)

引数 opt_tags は文字列として指定する点に注意

<img width="135" alt="スクリーンショット 2020-06-27 23 39 31" src="https://user-images.githubusercontent.com/51355545/85924813-88bc3c00-b8cf-11ea-96ee-cd777ba93b64.png">

## 配列/ハッシュから生成する options_for_select メソッド

与えられた配列やハッシュから option 要素を生成する。
![スクリーンショット 2020-06-27 23 45 14](https://user-images.githubusercontent.com/51355545/85924919-45ae9880-b8d0-11ea-91ef-65a091cfa391.png)
引数 container には配列とハッシュのいずれでも指定できる
<img width="122" alt="スクリーンショット 2020-06-27 23 50 48" src="https://user-images.githubusercontent.com/51355545/85925064-15b3c500-b8d1-11ea-8cda-ebf8e5cd3159.png">

## データベースから動的に生成する options_from_collection_for_select メソッド

選択肢をデータベースから生成
![スクリーンショット 2020-06-28 0 00 33](https://user-images.githubusercontent.com/51355545/85925299-6bd53800-b8d2-11ea-874b-1c494e275dc0.png)
<img width="130" alt="スクリーンショット 2020-06-28 0 04 55" src="https://user-images.githubusercontent.com/51355545/85925376-059ce500-b8d3-11ea-9c39-449a7fa1a0f8.png">

## グループ分けされた選択肢を生成する option_groups_from_collection_for_select メソッド

grouped_collection_select の select_tag 版
![スクリーンショット 2020-06-28 0 23 00](https://user-images.githubusercontent.com/51355545/85925752-8eb51b80-b8d5-11ea-88fd-171910462e18.png)
<img width="299" alt="スクリーンショット 2020-06-28 0 24 05" src="https://user-images.githubusercontent.com/51355545/85925775-b1473480-b8d5-11ea-9871-06b72d05adf3.png">

## 日付/時刻選択のための選択ボックスを生成する slect メソッド

![スクリーンショット 2020-06-28 1 16 06](https://user-images.githubusercontent.com/51355545/85926848-31bd6380-b8dd-11ea-8ea2-2fe0cae3e695.png)
![スクリーンショット 2020-06-28 1 16 21](https://user-images.githubusercontent.com/51355545/85926850-34b85400-b8dd-11ea-9152-a337ab7dec88.png)
![スクリーンショット 2020-06-28 1 16 12](https://user-images.githubusercontent.com/51355545/85926852-37b34480-b8dd-11ea-8582-7542b0e7fb7f.png)

## データベースの情報をもとにラジオボタン/チェックボックスの生成 collection_radio_buttons / collection_check_boxes メソッド

<img width="157" alt="スクリーンショット 2020-06-28 12 43 58" src="https://user-images.githubusercontent.com/51355545/85937278-0ff3c900-b93d-11ea-9ddd-6610c7a578c1.png">

## その他のフォーム系ヘルパー

- label メソッド
  ![スクリーンショット 2020-06-28 12 49 49](https://user-images.githubusercontent.com/51355545/85937383-e25b4f80-b93d-11ea-803c-b4f76cbd08be.png)
- submit メソッド
  ![スクリーンショット 2020-06-28 12 50 36](https://user-images.githubusercontent.com/51355545/85937413-50a01200-b93e-11ea-973d-59d8b7d1e8e6.png)
  <img width="764" alt="スクリーンショット 2020-06-28 12 58 25" src="https://user-images.githubusercontent.com/51355545/85937505-1b47f400-b93f-11ea-87fa-dacdcc384c53.png">
  <img width="197" alt="スクリーンショット 2020-06-28 12 58 09" src="https://user-images.githubusercontent.com/51355545/85937511-28fd7980-b93f-11ea-9757-67d33106a642.png">
  - <%= form.submit '保存', data: { confirm: '保存してもいいですか？', disable_with: '処理中'} %>
    update アクション中の sleep 命令は、指定された秒数だけ処理を休止する。
    処理が一瞬で終わってしまうと disable_with オプションで指定したテキストの表示が確認できない
    そのため、ダミー処理時間を発生させている
    実際に submit ボタンの OK を押下するとサブミットボタンが無効になり、かつキャプションが[処理中...]になる
  - また submit ボタンは保存済みであるかどうかを判定し、[Create モデル名],[Update モデル名]のようなキャプションを表示する。
    ![スクリーンショット 2020-06-28 13 11 49](https://user-images.githubusercontent.com/51355545/85937680-f5bbea00-b940-11ea-9a52-7752291ee698.png)

## form_for ブロックの中で異なるモデルを編集する-fields_for メソッド

- form_for ブロックの配下では、モデルを固定して入力フォームを生成するのが基本。
  fields_for メソッドを利用することで、複数のモデルを対象とした複合フォームを生成することもできる。
  ![スクリーンショット 2020-06-28 13 38 17](https://user-images.githubusercontent.com/51355545/85938070-aa0b3f80-b944-11ea-9c7c-1d1f146d78db.png)
  <img width="261" alt="スクリーンショット 2020-06-28 14 13 15" src="https://user-images.githubusercontent.com/51355545/85938584-944c4900-b949-11ea-85b9-2af9d572d8aa.png">

* field_for メソッドは form_for ブロックの配下で利用することを目的としたビューヘルパー
  ![スクリーンショット 2020-06-28 14 15 53](https://user-images.githubusercontent.com/51355545/85938782-26a11c80-b94b-11ea-9000-a599f58c10c5.png)
* 引数 var として@user.author を渡している。
  また,field_set_tag というメソッドを利用している。このメソッドはフォーム要素をグループ化するためのメソッド。サブフォームを表現するのに利用する。
  ![スクリーンショット 2020-06-28 14 23 55](https://user-images.githubusercontent.com/51355545/85938761-05d8c700-b94b-11ea-8d0a-d06e3344648c.png)

# 文字列/数値関連のビューヘルパー

## 改行文字列を p/br 要素で置き換えるー simple_format メソッド

- simple_format メソッドは与えられた文字列

  1. 文字列全体を p 要素で囲む
  1. 単一の改行文字には br を付与
  1. 連続した改行文字には/p p を付与

* simple_format メソッドを利用することで、改行文字を含むテキストをブラウザー上でも正しく表示できるようになる
  ![スクリーンショット 2020-06-28 14 42 04](https://user-images.githubusercontent.com/51355545/85939084-97e1cf00-b94d-11ea-8de0-f291dece20d8.png)
  ![スクリーンショット 2020-06-28 14 42 17](https://user-images.githubusercontent.com/51355545/85939085-9a442900-b94d-11ea-9266-07046d1f4902.png)
  <img width="303" alt="スクリーンショット 2020-06-28 15 12 54" src="https://user-images.githubusercontent.com/51355545/85939600-de392d00-b951-11ea-8235-6e18853a53ba.png">

## 引数 opts を利用した場合

- 太字のコードを書き換えて、動作オプション(引数 opts)を追加
  { sanitize: false, wrapper_tag: 'blockquote'}
  上記のようにすることで段落が p 要素ではなく blockquote 要素で囲まれている
  <img width="354" alt="スクリーンショット 2020-06-28 15 22 00" src="https://user-images.githubusercontent.com/51355545/85939804-4a686080-b953-11ea-912d-96e4f5309888.png">
  <img width="449" alt="スクリーンショット 2020-06-28 15 22 09" src="https://user-images.githubusercontent.com/51355545/85939805-4b998d80-b953-11ea-9b2f-2edaf7f3d658.png">

## 文字列を指定桁で切り捨てる truncate メソッド

- 投稿記事やメール本文をリスト表示するような状況で、タイトルだけを見ても内容がわかりにくいけれども、いちいち本文を開いて確認するのは面倒な場合によく使う。
  一覧に本文の先頭から 100 文字表示したい場合に使えるのが truncate メソッド。与えられた文字列を特定の桁数で切り捨てた結果を返す。
  ![スクリーンショット 2020-06-28 15 32 15](https://user-images.githubusercontent.com/51355545/85940015-e6469c00-b954-11ea-8182-32812e57df57.png)

  - truncate(msg, length: 50)
    変数 msg の内容を末尾の省略文字を含めて 50 文字になるように無条件に切り捨てる。
    <img width="488" alt="スクリーンショット 2020-06-28 15 44 11" src="https://user-images.githubusercontent.com/51355545/85940339-a385c380-b956-11ea-92a0-00ea33fcb647.png">

  * truncate(msg, length: 50, separator: '。')
    length オプションで指定した文字が登場するもっとも長い範囲で文字列を切り捨てる。
    <img width="456" alt="スクリーンショット 2020-06-28 15 44 17" src="https://user-images.githubusercontent.com/51355545/85940343-a5e81d80-b956-11ea-9689-16330fe07ec1.png">

  * truncate(msg, length: 50, omission: '...後略...')
    omission オプションはでは切り捨てた文字列の末尾に任意の文字列を指定することができる
    <img width="468" alt="スクリーンショット 2020-06-28 15 44 25" src="https://user-images.githubusercontent.com/51355545/85940345-a84a7780-b956-11ea-81c0-f6fc1ea6d561.png">

## 文字列からの特定の部分のみを抜粋する excerpt メソッド

- excerpt メソッドは文字列から特定の文字列を中心に、前後の文字列を抜き出す。
  よく似たメソッドに truncate メソッドもあるが、truncate メソッドが文字数で引用箇所を決めるのに対して、excerpt メソッドは特定のキーワードで決めるため、引用の目的がはっきりしている場合、より的確に抜粋できるメリットがある。
  ![スクリーンショット 2020-06-28 15 56 36](https://user-images.githubusercontent.com/51355545/85940628-75a17e80-b958-11ea-8a08-fa1fdc636fbf.png)
  ![スクリーンショット 2020-06-28 15 56 41](https://user-images.githubusercontent.com/51355545/85940631-7803d880-b958-11ea-8c9a-e34d3f0b4b32.png)
  - excerpt(msg, 'Catalyst', radius: 10)
    <img width="328" alt="スクリーンショット 2020-06-28 15 59 15" src="https://user-images.githubusercontent.com/51355545/85940638-83570400-b958-11ea-80ea-8daa4135eaf5.png">
    変数 msg から
  * excerpt(msg, 'Rails', radius: 10)
    <img width="174" alt="スクリーンショット 2020-06-28 15 59 21" src="https://user-images.githubusercontent.com/51355545/85940641-8651f480-b958-11ea-8dc2-e6ce9fe4c9cf.png">
  * excerpt(msg, 'Catalyst', radius: 10, omission: '～')
    <img width="324" alt="スクリーンショット 2020-06-28 15 59 26" src="https://user-images.githubusercontent.com/51355545/85940642-894ce500-b958-11ea-8885-f14d361564c1.png">

## テーブルやリストの背景色を n 行おきに変更する cycle メソッド

- HTML のテーブルを１行おきに背景色を変えるときに便利

  <img width="475" alt="F4j%AwikSg+EEQN4GEAwcA_thumb_50.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/0b9af1a8-cbbf-5cb6-f6cb-62dd90e7a935.jpeg">

  hello/list.html

```ruby
<tr style="background-color:<%= cycle('#FFffFF', '#FFff99')%>">
```

<img width="767" alt="スクリーンショット 2020-07-13 23.32.11.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/9413ff85-982a-d9b8-150f-64abd1295813.png">

```ruby
<tr style="background-color:<%= cycle('#FFffFF', '#FFff99','#FFaabb')%>">
```

<img width="743" alt="スクリーンショット 2020-07-13 23.33.50.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/f4e152b3-81f2-fdc2-2207-7c9f9e206a52.png">

- また現在の値を取得する current_cycle メソッドもある

  <img width="474" alt="qaiUGgccRSq5H9ESz+Le4A_mini_51.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a72a457b-b9ce-eebe-e7bb-d56c4ab78b89.jpeg">

```ruby
<td style="background-color:<%= cycle('#FFffFF', '#FFff99')%>"><%= book.title %></td>
<td style="background-color:<%= current_cycle %>"><%= book.price %></td>
```

<img width="753" alt="スクリーンショット 2020-07-13 23.43.54.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/55e69738-d883-830d-bd84-28a66ea4dd4a.png">

- サイクルを初期化する reset_cycle メソッドも用意されている

## 特定のキーワードをハイライト表示 highlight メソッド

- highlight メソッドを利用すると、文字列に含まれる特定の文字をハイライト表示できる

<img width="454" alt="neRGIF9sR4eP85ciG%FNjw_thumb_52.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/0fc394fd-917c-7432-746a-22c19f6add0f.jpeg">

<img width="748" alt="スクリーンショット 2020-07-14 0.28.31.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/67df397f-e81e-c9fb-5958-1e6bc6c2465a.png">

## スクリプトブロックの中に出力コードを埋め込む concat メソッド

- 以下のような単調な文を一文で表現できる

```ruby
<%= book.price %>
<% if book.price >= 3000 %>
  <%= image_tag 'expensive.gif' %>
<% end %>
```

上記を以下のようにできる

```ruby
<%= book.price %>円
<% if book.price >= 3000
  concat image_tag 'expensive.gif'
end %>
```

## 文字列から要素を除去する sanitize メソッド

- 引数 opts には tags/attributes キーで、それぞれ除去しない要素/属性を指定できる

<img width="467" alt="sAmtEzbYTAKUOa7y6VyLSw_mini_53.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/bfc3e0ad-d722-b2f2-5b13-5502f711ec74.jpeg">

## 文字列を整形する sprintf メソッド

- sprintf メソッドは指定された書式文字列に基づいて文字列を整形するためのメソッド

  rails ビューヘルパーではなく、ruby 標準の組み込みメソッド

<img width="468" alt="Jcb7mvCmRqGkPAKVxEDViA_mini_54.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/bd9a3435-4f5c-ee5f-973e-22f72bb98ede.jpeg">

```ruby
<%= sprintf('%.10s：全店舗数%d件の月総売り上げ%.1f千円、店舗平均は%10.3f千円です。', @name, @shop, @sum, @sum / @shop) %>
```

<img width="607" alt="スクリーンショット 2020-07-14 1.01.49.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/b9e89336-0ebf-ba3f-f248-c81fdae9e8b7.png">

<img width="517" alt="QTUAvNqvRcuyzXn3IGpiKw_thumb_55.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/351ab7cb-beac-3c65-0cf0-5e0a357aac80.jpeg">

<img width="512" alt="tcnoMgDOROCGTtjnk3hiow_thumb_56.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/7191ab2a-4eee-4a2f-5ad5-4bbb64e88eb9.jpeg">

- %.10f は文字列を最大 10 桁で表示しなさいという意味。@name の「WINGS プロジェクト有限会社」の 10 桁で「WINGS プロジェクト」が表示されている

- %d は整数での表示

- %.1f は小数点以下の桁数を指定したもの。なので小数点 1 桁まで表示されている

- %10.3f は符号と小数点を含め 10 桁で、小数点が 3 桁となる。

  10 桁足りない場合は空白が入る。

  もし 0 で埋めたい場合は%101.3f のようにする

- 数値を様々な形式で加工する number_xxxx メソッド

<img width="505" alt="B76YoBj7S66SDs4aLp+jQw_thumb_57.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/5f736533-6267-0c6f-57d8-986b7e778802.jpeg">

<img width="519" alt="S1dwWokgSc6Qxik0KiFPtg_thumb_58.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/e0baecb6-fe28-100e-bcd4-0960adf3ea68.jpeg">

- number_to_currency メソッドのデフォルトの通貨は「\$」、小数点以下桁数も 2 桁

- number_to_human メソッド。デフォルトでは桁数に応じて thousand、million などの表記が付与

  日本語対応のためには最低でも units パラメーターの設定は必須

  million パラメーターに対して「百万」という表記を割り当てている。

  もちろん、必要に応じて表 415 のパラメーターをハッシュ形式で渡すことも可能。

* number_to_human_size／number_to_percentage メソッドは、値に応じて KB、MB...のような単位、または「%」表記で値を表示。

* number_with_delimiter メソッドは、数値そのものの丸めは行わず、桁区切り文字や小数点の変更を行いたい場合に利用

* number_with_precision メソッドは指定された桁数で数値の丸めや表記を統一するためのメソッド

  単位を伴わない汎用的なメソッドなので、数値加工ではもっとも利用する機会が多

* precision／significant パラメーターの例。

  significant パラメーターは precision パラメーターの挙動を制御するためのパラメーター。

  false（または省略）時、precision パラメーターの値は小数点以下の桁数を表すものと見なされるので、不足桁を補った 123.45670 が返される。

  一方、significant パラメーターが true の場合、precision パラメーターは全体桁数（有効桁数）を表すものと見なされる。

  よって、整数部＋小数部が 5 桁となるよう丸められた 123.46 が返されます。

  strip_insignificant_zeros パラメーターは末尾の 0 を切り捨てる例。この場合、precision パラメーターが 5 なので、デフォルトでは 123.40000 のようになるはずが、0 が切り落とされた結果、123.4 が返される。

## 日付データを形成する strftime メソッド

<img width="485" alt="0wagLz9OSgOcFuUPnwiyWQ_thumb_59.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/62b836a7-9315-a2e5-ce68-992bb5433b1e.jpeg">
<img width="493" alt="PClbHpP0TS2DRR%qgt+kdw_thumb_5a.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/8b25b143-2541-e504-ad02-03d3c764a113.jpeg">

# リンク関連のビューヘルパー

## ハイパーリンクを生成する link_to メソッド

<img width="484" alt="rFV2gFQzQu2Aj95Cc6BJlA_thumb_5b.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/0e7f6c9e-d618-7bb1-46cb-8d14094edd1b.jpeg">
<img width="493" alt="noC6lsOuSGGFtI2yKL%o4A_thumb_5c.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/04c4d05b-fcf7-cb65-0318-c19c4c277db5.jpeg">

```ruby
<%= link_to 'サポートサイト', 'http://www.wings.msn.to/' %>
```

- 上記はシンプルな link_to メソッド。

  引数 body/url で指定されたリンクテキスト、URL に基づいて、アンカータグを生成する

  ただし外部リンクを link_to メソッドにする意味はあまりない。

```ruby
<%= link_to 'トップ', { controller: :hello, action: :index },
  id: :link, class: :menu %>
```

- 上記のようにコントローラ名(controller)/アクション名(action)から動的に URL を生成するのが一般的。

  引数 url はハッシュ形式で指定。

  ハッシュキーについては以降で後述。

  また引数 html_opt を指定した例でもある。

```ruby
<%= link_to '削除', book_path(1),
  { method: :delete, data: { confirm: '削除しても良いですか？'} } %>
```

- また上記のように引数 url を自動生成されたビューヘルパーで指定することもできる。

```ruby
<% @book = Book.find(1) %>
<%= link_to book_path(@book) do
  image_tag "http://www.wings.msn.to/books/#{@book.isbn}/#{@book.isbn}.jpg"
end %>
</a>
```

- 上記はリンクテキストをブロックで表した例。リンクテキストを動的に生成する場合に利用する。

# ルート定義から動的に URL を生成する url_for メソッド

- url_for メソッドは引数に与えられたオプション情報から URL 文字列を生成する。

  テンプレートで url_for メソッドを利用する機会は少ないが、link_to メソッドの引数指定は url_for メソッドのそれに準じる。

<img width="497" alt="lSPNm5ZBTMqNztrneIoHhw_thumb_5d.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a688d5ad-99d3-de58-0a65-4214f2bebc16.jpeg">

```ruby
<%= url_for(action: :new) %><br />
```

- url_for メソッドは現在のコンテキスト(コントローラー名やアクション名、その他パラメータ)を基点に URL を生成する。

  上記のように action 名だけ指定した場合にはコントローラ名は現在のもの(ここでは view を使う)

```ruby
<%= url_for(controller: :books, action: :show, id: 5,
  anchor: 'rails', charset: 'utf8') %><br />
```

- 上記は id/anchor/charset などのパラメータを指定した例。

  id はルート定義(/books/:id(.:format))に含まれているので、そのまま URL の一部として取り込まれる。

  anchor パラメータはアンカー(「#~」の部分)として URL の末尾に付与される。

  予約パラメータでもなく、ルート定義にも含まれていないパラメータ、charset のようなパラメータが指定された場合、クエリ情報として追加される。

```ruby
<%= url_for(action: :login, controller: :members,
  only_path: false, protocol: 'https') %><br />
```

- 上記は only_path パラメータを false にした例。

  url_for メソッドはデフォルトでサイトルートからの相対パスを生成するが、only_path パラメータを false に指定することで、プロトコル/ホスト名を含んだ絶対パスを返す。

```ruby
<% @book = Book.find(2) %>
<%= url_for(@book) %><br />
```

- url_for メソッドには上記のようにオブジェクトを引き渡すこともできる。

  オブジェクトの主キー値に応じて「/books/2」のようなパスが生成される。

```ruby
<%= url_for(:back) %>
```

- url_for メソッドの特殊な用法で、引数に:back を指定した場合、url_for メソッドは Refere ヘッダー(todo)の値を返す。

  Refere ヘッダーの値が空のとき「javascript:history.back()」という JavaScript 擬似プロトコルを返す。

<img width="270" alt="スクリーンショット 2020-07-14 22.58.22.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ef4ead91-c436-b0e0-0fa8-8d42a2c1ad75.png">

### 補足

- コントローラ側で default_url_option メソッドをオーバライドすることで、url_for メソッドにデフォルトで渡すパラメータを指定できる。

  /view_contoroller.rb

```ruby
def default_url_options(options = {})
    { charset: 'utf-8' }
  end
```

- 結果は以下のようになる

<img width="405" alt="スクリーンショット 2020-07-14 23.03.58.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ec4e06f1-aff0-9a90-4f6e-37e302a95539.png">

## 条件に応じてリンクを生成する link_to_if/link_to_unless

- link_to メソッドの派生系として、条件式の正否に応じてリンクを生成する link_to_if/link_to_unless メソッドがある。

<img width="491" alt="c18PfVWPT%G8%x40zFbEsw_thumb_5f.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/141773b2-a804-b79c-b388-9c7eada0cb7c.jpeg">

- link_to_if メソッドは引数 condition が true の場合にはアンカータグを、false の場合には引数 name に基づいて固定テキストのみを出力する。

  ただし、引数&block(ブロック)を指定した場合には、引数 name に代わりにブロックの内容を出力する。

  link_to_unless メソッドは、link_to_if メソッドとは逆に、引数 condition が false の場合にアンカータグを出力する。

```ruby
<%= link_to_if @user.nil?, 'ログイン',
  controller: :login, action: :index %><br />
```

- 上記は変数@user がからの場合に「ログイン」リンクを生成する。

* 上記と同じ内容を unless で表すと下記

```ruby
<%= link_to_unless @user, 'ログイン',
controller: :login, action: :index %><br />
```

```ruby
<%= link_to_if @user.nil?, 'ログイン',
controller: :login, action: :index do |name|
link_to 'マイページ', controller: :login, action: :info
end %>
```

- 上記はブロックを定義した例。

  @user.nil?が false の場合、テキストではなく、ブロックで指定されたリンクを出力する。

  ブロック変数として引数 name がわたされる。

  よって@user が空の場合はログインリンクを、そうでない場合はマイページリンクを出力する。

## 現在のページの場合はリンクを無効にする link_to_unless_current メソッド

- link_to_unless メソッドの特殊形として、link_to_unless_current メソッドがある。

  これはリンク先が現在のページである場合にリンクの代わりにテキストのみを出力する。

  レイアウト上で共通なメニュなどを生成する場合に便利なメソッド

<img width="474" alt="ISZpOWQRTKyJiJzSwKTsrw_thumb_5e.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ecf70b75-7c93-b668-ebe6-7fdef6b85d97.jpeg">

- 一覧への部分がテキスト化されている

<img width="128" alt="スクリーンショット 2020-07-14 23.33.35.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/6a448cc0-83a6-9b07-b0ba-96bed2c30088.png">

## メールアドレスへのリンクを生成する mail_to メソッド

- mail_to メソッドは指定されたメールアドレスに基づいて mailto:リンクを生成する

<img width="482" alt="FH7DRqUNQwuvM6c89Zccdw_thumb_60.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/1b6bb2f6-04ff-ce5a-f33f-875afc840d82.jpeg">

<img width="396" alt="IncMVqeeTrG18azzinYHdA_thumb_61.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/90e774f6-9e66-39f4-d2fc-b8f3effdadc7.jpeg">

- 以下のようになる

<img width="185" alt="スクリーンショット 2020-07-14 23.57.25.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/645718fa-62fa-1b19-6b0a-a7f0ce1ce277.png">

- 引数 otp に件名などを指定することができる

<img width="395" alt="スクリーンショット 2020-07-14 23.57.03.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/cc7dbc65-9ee6-5f08-ad3c-86f86fb8dc1b.png">

# 外部リソース指定のためのビューヘルパー

- 外部スクリプトやスタイルシート、画像、音声、動画などのリソースを指定する場合、「/images/raisl.png」のようなパスを直接指定するのは好ましくない。

  環境を移行した場合などにリンク切れを起こす原因になる。

  リソース指定の場合は原則として Asset ヘルパーを利用すること。

- Asset ヘルパーはビューヘルパーの中でも<img>,<link>,<script>,<audio>,<video>

  などのリソースを取得するための要素を生成するヘルパーの総称。

- Asset ヘルパーのうち、javascript_include_tag/stylesheet_link_tag メソッドは Asset Pipeline と呼ばれる仕組みと密接に関連しており、以降で後述する

## 画像を表示する image_tag メソッド

- image_tag メソッドは<img>要素を生成するヘルパー

  <img width="507" alt="DVvUscv2RBiITcMo1FdJZQ_thumb_62.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/baed4770-aa7b-2e5d-d871-bb6f960e3ef8.jpeg">

  <img width="196" alt="スクリーンショット 2020-07-15 0.45.32.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/66b8ba62-e5d3-cb54-c023-8ea48658fda7.png">

```Ruby
<%= image_tag 'wings_logo.gif' %><br />
```

- 引数 src で相対パスが指定された場合に画像ファイルは/app/assets/images フォルダ下に保存されているものとみなし、

  「/assets/wings_logoxxxxx.gif」のようなパスが生成される。

```ruby
<%= image_tag '/icons/button.gif' %><br />
```

- 上記のように「/icons/button.gif」のように「/」ではじまるパスで表すことで、/public（公開）フォルダー配下の任意のフォルダーに配置することもできる。

/public/icons フォルダー配下に button.gif が配置されているものと見なされる。

```ruby
  <%= image_tag 'http://www.web-deli.com/image/linkbanner_s.gif' %><br />
```

- 画像ファイルが外部サーバーに配置されている場合には、上記のように「http://」形式のURLを指定することも可能。

- また、上記 3 つともに alt オプションが指定されていない。

  この場合、image_tag メソッドは画像ファイルのベース名（ファイル名から拡張子を取り除いたもの）から生成した文字例を alt 属性としてセットする。

```Ruby
<%= image_tag 'fish.jpg', alt: '沖縄の魚', size: '120x90' %><br />

<%= image_tag 'fish.jpg', alt: '沖縄の魚', width: 120, height: 90 %><br />
```

- 上記は画像サイズを指定する例です。 size オプションで幅、高さをまとめて指定することもでき、width／height オプションで個別に指定することもできる
