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

- Asset ヘルパーはビューヘルパーの中でも「img,link,script,audio,video」

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

- 画像ファイルが外部サーバーに配置されている場合には、上記のように「http://」形式の URL を指定することも可能。

- また、上記 3 つともに alt オプションが指定されていない。

  この場合、image_tag メソッドは画像ファイルのベース名（ファイル名から拡張子を取り除いたもの）から生成した文字例を alt 属性としてセットする。

```Ruby
<%= image_tag 'fish.jpg', alt: '沖縄の魚', size: '120x90' %><br />

<%= image_tag 'fish.jpg', alt: '沖縄の魚', width: 120, height: 90 %><br />
```

- 上記は画像サイズを指定する例です。 size オプションで幅、高さをまとめて指定することもでき、width／height オプションで個別に指定することもできる

## 音声/動画をブラウザーで再生する audio_tag/video_tag メソッド

- aoudio_tag/video_tag メソッドは<audio>/<video>要素を生成するためのヘルパー

  <audio>要素と<video>要素はいずれも HTML5 で追加された比較的新しい要素.

  Internet Explorer 8 のような古いブラウザでは動作しない。

![スクリーンショット 2020-07-16 0.15.57.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/d9854389-5e4f-9e12-a91e-3a7a4d222853.png)
![スクリーンショット 2020-07-16 0.16.38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/eb50b567-b94c-e408-4e27-7c7793b105b1.png)
![スクリーンショット 2020-07-16 0.16.50.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/1661b1f8-83c8-1671-c2bf-a2b0c174c93f.png)

## ブラウザーのフィード検出機能を有効にする auto_discovery_link_tag メソッド

- RSS フィードや Atom フィード(todo:知らない)を自動検出させるための機能

- 上記もうないのかもしれない

## サイトの Favicon を定義する favicon_link_tag メソッド

- ファビコン(favicon)はサイトに関連付けられたアイコンを指す。

  ブックマークやアドレス欄、タブなどでは、ページタイトルや URL と併せてファビコンが表示される。

  文字列だけの表示より、視認性が良いため、最近では多くのサイトがファビコンに対応している。

  <img width="478" alt="V5zSwY9EQFuA%rUVm+f45g_thumb_64.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/fa0d294f-93f6-b43d-60ca-31366924758d.jpeg">
  ![スクリーンショット 2020-07-19 15.52.29.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/bb864481-6725-a70f-6f6e-c03640c34281.png)
  <img width="473" alt="rqD6cf0ERBq4++H2igXU1g_thumb_65.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/62145a71-a367-8dd7-472f-3632fce31a60.jpeg">

* .png 形式の画像を指定する場合は、opt で type パラメータを明示的に書く必要がある。

## 外部リソースのパスを取得する xxxx_path メソッド

- 対応するパスだけを取得したい場合に使用する。
  <img width="476" alt="VwoGCAD%S0mFBp2ncDh4xA_thumb_66.jpg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a3911c9d-ba8d-b2d9-ae06-90c3b8ddeebf.jpeg">

![スクリーンショット 2020-07-19 16.06.21.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/cc4ec5b2-161d-ae8e-8137-2eeb780a0b60.png)

# その他のビューヘルパー

## 構造化データをダンプ出力する debug メソッド

- テンプレートに渡された配列やオブジェクトの内容を確認するには、debug メソッドを利用すると便利。

  debug メソッドは指定された変数の内容を人間の目にも読みやすい YAML 形式で出力する。

  テンプレートに意図したデータが渡されているかを確認したい場合に重宝する。

![スクリーンショット 2020-07-19 22.13.43.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/719389f3-bbd7-967d-c288-bfe4a3ddc1b2.png)

![スクリーンショット 2020-07-19 22.19.11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/25f51708-cfa2-78ad-de37-a2b9f8b2f18d.png)

## 出力結果を変数に格納 capture メソッド

- caputure メソッドを利用すると、断片的なテンプレートの結果を変数に格納できる。

  部分テンプレートにするどほどでものないものの、テンプレートの複数箇所で再利用するようなコンテンツを定義するさいに便利

![スクリーンショット 2020-07-19 22.34.32.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/72640d5d-d588-0401-76d1-36fb3da665a4.png)

## 本体を持たない任意の要素を生成する tag メソッド

- 本体を持たない要素を生成するには、tag メソッドを利用する。

![スクリーンショット 2020-07-19 22.41.09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/b93c8143-82e6-d5f6-6fa1-e0139c1d4fb0.png)

![スクリーンショット 2020-07-19 23.05.23.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/1511a92b-9adc-b352-b7a4-9dea89456aef.png)

## 本体を持つ任意の要素を生成する content_tag メソッド

- 本体を持つ要素を生成するには、content_tag メソッドを使用する。

![スクリーンショット 2020-07-19 23.05.59.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/20b33a66-4e69-1c04-33be-9a5811b0d94a.png)

![スクリーンショット 2020-07-19 23.07.57.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/c21c3aac-abea-fb01-c137-fb3b769c91ed.png)

- 要素の本体は引数 content として指定することも、ブロックとして指定することもできる。

- content_tag メソッドを入れ子にして、改装を持った要素を生成する。

  コードの可読性は低下するので、２〜3 階層程度に留めるのが無難。

# ビューヘルパーの自作

- Rails ではビュー開発を支援するビューヘルパーを標準で数多く提供している。

  しかし、実際にアプリを開発していく上で「このようなヘルパーも欲しい」と思う局面がある。

  そのようなときに、ビューヘルパーを自作することもできる。

## シンプルなビューヘルパー

- ビューヘルパーは、/app/helpers フォルダー配下の xxxx_helper.rb に記述するのが基本。

  たとえばここでは ViewContoroller に対応する view_helper.rb(モジュール)にヘルパーを定義する。

- format_datetime メソッドに注目すると、ビューヘルパーとはいっても単なるメソッド。

  引数として受け取った datetime(日付時刻値)、type(フォーマット種別)をもとに、日付時刻を整形し、戻り値として返すだけ。

![スクリーンショット 2020-07-19 23.34.11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/6e2921db-da42-f2eb-1812-512f0ab05d3b.png)

- Rails5 のデフォルトでは、/app/helpers フォルダー配下から、application_helper.rb と、現在のコントローラに対応したコントローラ名\_helper.rb だけが呼び込まれる。

  一般的には、アプリ全体で利用するヘルパーは application_helper.rb にコントローラ固有のヘルパーは<コントローラ名>\_helper.rb に記述すると、ヘルパーを管理しやすい。

## HTML 文字列を返すビューヘルパ

- form_tag や image_tag などのように、ビューヘルパの結果として HTML 文字列を返したい場合も多くある。

  content_tag/tag メソッドを利用するのが便利。

- 例えば与えられたオブジェクト配列 collection からプロバティ値(prop)の箇条書きリストを生成する list_tag メソッドの例。

```ruby
# collection: リストのもととなるオブジェクト配列
  # prop: 一覧するプロパティ名
  def list_tag(collection, prop)
    # <ul>要素を生成
    content_tag(:ul) do
      collection.each do |element|
        # <ul>要素配下の<li>要素を順に生成
        concat content_tag(:li, element.attributes[prop])
      end
    end
  end
```

- content_tag メソッドを利用することで、要素配下のテキストは適切にエスケープ処理される。

  もちろん、要素部分はそのまま出力してくれるというメリットがある。

  また複雑な階層構造になった場合も content_tag メソッドのネストで表現できるので、文字列連結での処理に比べると可動性も維持しやすい。

- 文字列処理で記述するとしたら以下になる。

```ruby
def list_tag2(collection, prop)
    list = '<ul>'
    collection.each do |element|
      list.concat('<li>')
      list.concat(h element.attributes[prop])
      list.concat('</li>')
    end
    raw list.concat('</ul>')
  end
```

- テキスト部分は h メソッドでエスケープ処理し、最終的な結果文字列は raw メソッドでそのまま出力している。

  これはコーディングが面倒なだけでなく、うっかりするとエスケープ漏れの原因にもなる。

![スクリーンショット 2020-07-20 0.52.57.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/6768d3a6-95a5-9500-2e16-31bb654a11eb.png)

## 本体を持つビューヘルパ

- form_tag や content_tag メソッドのように、本体を持つビューヘルパーを定義することもできる。

  次のような構文を持ち blockquote 要素を生成する blockquote_tag メソッドを実装している。

  blockquote 要素は他の文章からの引用を表す。

![スクリーンショット 2020-07-20 0.58.11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/043dd841-b758-7f70-3398-cb79831b9a10.png)

### ブロックを定義して処理する

- ビューヘルパーの本体を受け取れるようにするには、引数としてブロックを受け取る&block を設置しておく。

ブロック&block の内容を処理しているのは capture メソッド。

capture メソッドは与えられたスクリプトブロックを解釈し、その結果を文字列として返す。

あとはブロックの結果をもとに前項と同じく必要なタグ構造を組み立てていく。

### 任意の属性を受け取る

- もう一つ、サンプルで注目しておきたいのは引数 options。

  ビューヘルパーでは任意の属性を指定したいというケースもある。

  その場合は、サンプルのように引数 options でハッシュを受け取れるようにしておいて、必要に応じて必須の属性(ここでは cite 属性)を結合する。

  「属性名:値」の形式のハッシュはそのまま content_tag メソッドの引数として引き渡すことができる。

# アプリ共通のデザインを定義する レイアウト

- レイアウト、あるいはレイアウトテンプレートはヘッダー、メニュー、フッターのようなサイトの共通レイアウトを定義する。

  いわゆる外枠。

  レイアウトを利用することで以下のような構造のサイトも簡単に実装できる

![スクリーンショット 2020-07-20 1.58.47.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/348c8cd6-2955-2c06-d5ea-715913f8b509.png)

- ヘッダーやフッター、メニューなどアプリ共通の部分はレイアウトとして用意しておき、コンテンツ部分だけをページ単位で作成する。

## レイアウトを適用する様々な方法

- rails では特に何も指定しない場合、/app/views/layouts フォルダー配下の application.html.erb をレイアウトとして適用しようとする。

  application.html.erb はプロジェクトを作成した時点で既にできているはずなので、通常はこれをもとにカスタマイズを進める。

- 実際のアプリでは必ずしもページで 1 つのレイアウトを共有しているとは限らない。

  特定のコントローラやアクション単位でレイアウトを変更したい、そもそもレイアウトを適用したくない、ということもある。

### コントローラ単位でレイアウトを設定する

- コントローラ単位のレイアウトは/app/views/layouts フォルダ配下にコントローラ名.html.erb という名前で保存する。

books コントローラであれば、/app/views/layouts/book.html.erb

コントローラ名.html.erb が存在しない場合は、継承をたどって、親コントローラのレイアウトを適用しようとする。

### コントローラ単位でレイアウトを設定する (layout メソッド)

- layout メソッドを利用すると、コントローラクラスの中で明示的に適用すべきレイアウトを指定できる。

* app/controllers/books_controller.rb

```ruby
layout'product'
```

- 上記は app/views/layouts/product.html.erb がコントローラデフォルトのレイアウトとして適用される。

### アクション単位でレイアウトを設定する

- アクション単位でレイアウトを変更するには、render メソッドで layout オプションを指定する

* view_controller

```ruby
def adopt
    render layout: 'sub'
end
```

- /app/views/layouts/sub.html.erb が adopt アクションのレイアウトとして適用される。

- また render layout オプションまたは layout メソッドで false を指定すると、レイアウト機能を無効化することもできる。

## ページ単位でタイトルを変更する

- レイアウトにも通常のテンプレートファイルと同じく、テンプレート変数を埋め込むことができる。

  なので、ページごとにタイトルを変更するならば、レイアウトを以下のように記述すれば良い。

- layouts/application.html.erb

```
<!--<title><%= @title ? @title : 'Rails入門' %></title>-->
<!--<title><%= @title || 'Rails入門' %></title>-->
<!--<title><%= yield(:title) || 'Rails入門' %></title>-->
```

- ここではテンプレート変数@title が空(未設定)である場合にはデフォルトの「Rails 入門」を、そうでない場合には@title の値をそれぞれタイトルとして割り当てる。

- provide ヘルパーを利用すると、個々のテンプレートからレイアウト側にタイトルを引き渡すこともできる。

* view/provide.html.erb

```
<% provide :title, 'provideヘルパーの例' %>
```

![スクリーンショット 2020-07-20 3.04.15.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ef858ade-ba0b-8550-53e8-70a7105dacaa.png)

## レイアウトに複数のコンテンツ領域を設置する

- デフォルトのレイアウト(application.html.erb)は、初期状態でコンテンツ領域を 1 つだけしか持っていない。

  ときには複数のコンテンツ領域を持たせたいこともある。

  たとえばメインコンテンツ以外にもヘッダーの一部をページ単位に切り替えたいといったケース。

  ![スクリーンショット 2020-07-20 3.10.45.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/9f3a4662-3f42-5fee-551a-99ddcfd52115.png)

* このようなケースではレイアウトに複数の<%= yield %> を埋め込む。

  たとえば複数の領域を定義したレイアウトの例.

* layouts/layout.html.erb

```
<!DOCTYPE html>
<html>
<head>
  <title><%= @title ? @title : 'Rails入門' %></title>
  <%= stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => true %>
  <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
  <%= csrf_meta_tag %>
</head>
<body>
 <%= yield :extend_menu %> <!---追加した固定コンテンツ領域--->
<hr />
<!--- ...その他の固定コンテンツ... --->
<hr />
<%= yield %> <!---デフォルトのコンテンツ領域--->
</body>
</html>

```

- 複数のコンテンツ領域を定義する場合には、yeild メソッドの引数として領域名を指定する。

  上の例ではデフォルトのコンテンツ領域と、:extend_menu という名前のコンテンツ領域を定義している。

- このようなレイアウトにたいしてコンテンツを埋め込むには、テンプレートファイルで content_for メソッドを利用する.

* views_controller

```ruby
def multi
    render layout: 'layout'
end
```

```ruby
<% content_for :extend_menu do %>
［<%= link_to '関連情報', action: :relation %>］
［<%= link_to 'ダウンロード', action: :download %>］
［<%= link_to 'アンケート', action: :quest %>］
<% end %>
<div id="main">
...コンテンツ本体...
</div>

```

![スクリーンショット 2020-07-20 3.29.27.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/59dc2ccb-d49c-17c3-3e1c-15b54549eb14.png)

- 上記のように名前付きのコンテンツ領域にセットするコンテンツは content_for ブロックで定義する。

![スクリーンショット 2020-07-20 3.38.19.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/24da7abc-8b28-5187-8405-f1608c88a39b.png)

- [関連情報][ダウンロード][アンケート]リンクを:extend_menu コンテンツとして定義している。

  デフォルトのコンテンツはこれまでと同じく特別な囲みなどを意識することなく、テンプレート直下に記述できる。

## レイアウトを入れ子に配置する

![スクリーンショット 2020-07-20 3.41.56.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/db3ef0a5-811d-06af-baca-45d07330037b.png)

- ヘッダー/フッター部分は企業共通ですが、メニュ部分は事業部門ごとに異なる。

  このようなケースで、それぞれの事業部門レイアウトに企業共通のヘッダーデザインまで持たせるのは望ましくない。

  ヘッダーデザインに変更が生じた場合、すべての事業部門レイアウトを修正する必要がある。

  このような場合はレイアウトを入れ子にすることで、ヘッダー/フッター部分を１つのレイアウトとして管理できる。

  ![スクリーンショット 2020-07-20 3.44.52.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/49967b2c-8cdb-f415-7484-1e3af3595d35.png)

* application.html.erb はアプリ共通のレイアウト、layouts/child.html.erb は入れ子部分のレイアウト、view/nest.html.erb はメインテンプレートを表す。

* application.html.erb

```
<body>
<%= content_for?(:content) ? yield(:content) : yield %>
</body>
```

![スクリーンショット 2020-07-20 3.52.35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/8a8c740e-5600-a6c2-7d88-3ea515f3eab7.png)

- rails では本質的な意味でレイアウトのネストに対応しているわけではない。

  レイアウト定義を複数に分割し、呼び出しを工夫することで、ネストを表現していると考え方が良い。

![スクリーンショット 2020-07-20 3.55.41.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/76848bf0-f56e-cc39-e1b5-2f0e26dd746d.png)

- nest アクションは対応するテンプレートとして nest.html.erb を、layout オプションで子レイアウト child.html.erb を呼び出している。

- 子レイアウト child.html.erb に注目してみると、コンテンツが content_for メソッドで定義されていることが確認できる

  テンプレート nest.html.erb で既にデフォルトのコンテンツ(:layout)が暗黙的に使われてしまっているので、区別するために:content を定義している。

  :content の配下では、:layout をインクルードするための yield を呼び出す。

  ここまではほぼ標準的なレイアウトを呼び出すが、ここからさらにレイアウトをネストさせるために必要な記述が child.html.erb の<%= render template: 'layouts/application' %>。

  子レイアウト child.html.erb から親レイアウト application.html.erb を呼び出すためには、render メソッドの template オプションを利用して、明示的に呼び出す必要がある。

  最後は親レイアウト application.html.erb の記述。

  <%= content_for?(:content) ? yield(:content) : yield %>

  content_for?メソッドは指定されたコンテンツが存在するかどうかを判定する。

  ここでは content の有無を確認し、存在する場合は:content を、そうでない場合は標準の:layout を呼び出すようにしている。

  サンプルでは 2 階層のレイアウトだが、3 階層以上のレイアウトを定義することも可能

### コマンドラインから Rails のコードを実行する

- rails runner コマンドを利用すると、Rails 環境をロードした上で、指定のコードを実行できる。

  たとえば、セッションをデータベースで管理している場合、古くなったセッション情報を定期的に破棄するなどの用途で利用する。

  rails runner コマンドを利用するには以下のように文字列として実行したいコマンドを渡すだけ。

  定期的に自動実行したい処理を定義したいときは rails runner コマンドをファイルとして用意した上で、cron などのスケジューラに登録する。

  rails runner 'FanComment.where(deleted: true).delete_all'

  上記は Active Record のメソッドを直接呼び出すが、より複雑な処理を行う場合にはメソッドを準備し、コマンド上て指定するコードはシンプルに記述するべき。

  たとえば rails runner app/models/book.rb をして、book.rb に puts 'aaa'など書くと aaa と表示される。

# テンプレートの一部をページ間で共有する 部分テンプレート

- 部分テンプレートは断片的なテンプレートファイル。複数のページを共通で利用するような領域がある場合に使用することで、同じようなコードを記述する必要がなくなる。

  レイアウトにも似ているが、レイアウトはヘッダーやフッターのようなページの外枠を定義するために利用する。

## 部分テンプレートの基本

- 部分テンプレートを保存する場合にはファイル名に「\_」をつけなければならない。

  保存先位は以下の表に沿ってやること

  ![スクリーンショット 2020-07-30 23.27.26.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/f1a51ba5-5e8a-c8a6-9f3e-4141e69a8eff.png)

* 特に 3 はあとから見ても分かりやすいコードをシンプルに記述する上で役に立つルール。

  フォルダ名は複数形で、ファイル名が単数形とするのがポイント

  また定義された部分テンプレートをメインテンプレートに埋め込むには render メソッドを利用する。

  render メソッドの引数には「パス/部分テンプレート名」を渡す。

  部分テンプレート名とはファイル名から先の「\_」と「.html.erb」を取り除いたもののこと。

  つまり books/\_book.html.erb を呼び出すという意味になる。

### アプリ共通の部分テンプレート

- アプリ共通の部分テンプレートは/views/application フォルダーに配置するべき。

  ここに配置された部分テンプレートはグローバルな部分テンプレートと見なされ、次のようなコードで呼び出すことができる。

```
<%= render 'book' %>
```

- 同名の部分テンプレートがメインテンプレートと同じフォルダーにも存在する場合、例えば/view/\_book.html.erb がある場合、同じフォルダー配下の部分テンプレートが優先される。

## 部分テンプレートにパラメータを引き渡す

- 部分テンプレートはアクションメソッドで定義されたテンプレート変数をそのまま利用できる

  しかし、テンプレート変数に依存した部分テンプレートには再利用性という点で問題がある。

  テンプレート変数に依存した部分テンプレートを利用するには、全てのアクションメソッドを同名のテンプレート変数を用意しておく必要があるから。

  これは部品の独立性という意味でも望ましい状態ではない。

  部分テンプレートに汎用性を持たせるためには、部分テンプレートで利用する情報はできるだけパラメータ(引数)経由で渡すようにすると良い。

  ![スクリーンショット 2020-07-30 23.55.25.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/edde764f-f2c2-3cfd-fe39-34607336a52a.png)

- type パラメータを設置し、バナー画像の表示/非表示(:details/:simple)をパラメータ指定で切り替えられるようにする。

  ![スクリーンショット 2020-07-30 23.58.54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/1388c6b1-ff02-a2c0-a2e0-f262c53a72b7.png)

* パラメータ経由で渡された情報はローカル変数としてアクセスできる。

  変数 type や book が該当する。

  部分テンプレートからテンプレート変数が取り除かれたのでアクションメソッドの側で部分テンプレートを意識する必要がなくなる。

  type パラメータが正楽された場合にデフォルトで:details をセットしている。

  部分テンプレートに渡すパラメータ情報は、render メソッドの第二引数以降に「パラメータ名: 値, 」の形式で指定する。

  ![スクリーンショット 2020-07-31 0.26.36.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/e6c28223-2793-241f-eed6-6b25ff61d591.png)

## 部分テンプレートにレイアウトを適用する パーシャルレイアウト

- メインテンプレートと同じく、部分テンプレートに対してもレイアウトを適用できる。

* ただし、ファイル名の先頭には部分テンプレートと同じく、「\_」を付与しなければならない

* layout を呼び出すときは、partial オプション(partial: 'books/book')も省略できない。

  ![スクリーンショット 2020-07-31 19.18.21.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/5ac07e26-f091-7150-e5cf-9d7f11a11683.png)

## コレクションの繰り返し部分テンプレートを適用する collection オプション

- render メソッドの collection オプションを利用すると、コレクション(配列)に対して、部分テンプレートを適用するようなコードがシンプルに記述できる。

- 例えば@book = Book.all をコントローラに書いたさいに、collection オプションを利用することで、@books の内容がなくらるまで順に部分テンプレートが適用される。つまり、each メソッドの繰り返しの記述が不要となる。

```
<% @books.each do |book| %>
  <%= render 'books/book', book: book, type::details %>
<% end %>
```

- つまり collection を使うと、上記の<% @books.each do |book| %>~<% end %>が不要になる。

* ただし、partial オプションが省略できない。

  また、その他のパラメータは locals オプション配下で渡す必要がある。

  ![スクリーンショット 2020-08-01 17.35.09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ac184cfd-fe07-90ee-bf41-408071b5e4f5.png)

### 部分テンプレートで利用できる予約変数

- collection オプションを使った場合、部分テンプレートでは「部分テンプレート名\_iteration」という予約変数(イテレーション変数)を利用できる。

- 連番で表示ができるようになる。

  ![スクリーンショット 2020-08-01 17.52.10.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/59a72165-981c-f159-7cce-85f406528801.png)

* イテレーション変数は index の他に以下のようなメソッドを持つ

  ![スクリーンショット 2020-08-01 17.55.09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a13f79a0-fdea-5753-1438-90a406e142cc.png)

### 区切りテンプレートを定義する

- collection + spacer_template オプションを利用するとテンプレートどおしを区切るセパレータを指定できる。

  ![スクリーンショット 2020-08-01 18.09.08.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/f5147188-1469-271a-60e1-0ac9a61dc431.png)

### コレクションにパーシャルレイアウトを適用する

- collection + layout オプションを利用することで、コレクションの各要素に対して適用された部分テンプレートの 1 つ 1 つに対して、パーシャルレイアウトを適用できる

![スクリーンショット 2020-08-01 18.15.12.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/18577cf5-f01d-e003-f5bb-2c874a9aa0ea.png)

# モデル開発

## データ取得の基本 find メソッド

```rb
def find
  @books = Book.find([2,5,10])
  render 'hello/list'
end
```

find メソッドでは引数に配列を渡すことで主キー値に一致するレコードを取り出すことができる

## 任意のキー列による検索 find_by メソッド

find_by メソッドは任意の列をキーにテーブルを検索し、ヒットした最初の 1 件を取得する。

```rb
def find_by
  @book = Book.find_by(publish: "技術評論社")
  render 'books/show'
end

def find_by2
  @book = Book.find_by(publish: '技術評論社', price: 2980)
  render 'books/show'
end
```

## より複雑な条件での検索を行う クエリメソッド

find や all 以外の複雑な条件式や、ソート、グループ化、範囲抽出、結合など行うためにクエリメソッドがある。

### クエリメソッドの基礎

![スクリーンショット 2020-09-03 0.39.11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ea00fe2f-3f16-9fd3-dcf1-d41d084f7bee.png)

上記メソッドは find や find_by などのメソッドと違い、その場ではデータベースにアクセスしない。

条件句を追加した結果を ActiveRecord::Relation オブジェクトとして返すだけ。

そして、結果が必要になったところではじめて、デーザベースに問い合わせる。

これを遅延ロードという。

### 基本的な条件式を設定 where メソッド

where メソッドの簡単な使い方は条件式をハッシュで表現すること。

```rb
def where
  @books = Book.where(publish: '技術評論社')
  render 'hello/list'
end
```

その他にも引数の指定を変更することで、さまざまな条件式を表現できる。

![スクリーンショット 2020-09-03 1.14.58.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/22a5078a-ef31-9079-387c-022fb59f05c9.png)

「フィールド名:値」の組を複数指定した場合、条件式は論理積(AND)で連結される。

2 は範囲式(..)を使用することで、BETWEEN 演算子を使っている。

3 のように値を配列で複数指定した場合は、IN 演算子が生成される。

### プレースホルダーによる条件式の生成 where メソッド(2)

ハッシュによる条件式の指定は手軽だが、表現の幅に限界がある。

条件式をプレースホルダー付きの文字列で指定する。

```rb
def ph1
  @books = Book.where('publish =? AND price >= ?', params[:publish], params[:price])
  render 'hello/list'
end
```

```
<%= form_tag action: :ph1 do %>
  <div class="field">
    <%= label_tag :publish, '出版社:' %>
    <%= text_field_tag :publish %>
  </div>
  <div class="field">
    <%= label_tag :plice, '最低価格:' %>
    <%= text_field_tag :price %>
  </div>
  <%= submit_tag '検索' %>
<% end %>
```

引数に含まれる「?」がプレースホルダー。

プレースホルダーにセットすべきパラメータ値は第 2 引数以降で指定する。

プレースホルダーを利用することで条件式そのものとパラメータ値とを明確に分離できる。

なので複雑な条件式になった場合でもコードの見通しを維持しやすいというメリットがある。

### 名前付きパラーメターと名前なしパラメーター

where メソッド(2)が名前なしパラメータ。

名前付きパラメータは以下

```rb
def ph1
  @books = Book.where('publish = :publish AND price >= :plice', publish: params[:publish], price: params[:price])
  render 'hello/list'
end
```

名前付きパラメータの名前は自由に決めていいが、関係性がわかりやすいように比較対象となるフィールドと同名によるのが一般的。

いずれも値をあとから動的に割り当てるという点では同じ。

ただし、名前付きパラメータはパラメータと値の対応がわかりやすいが、記述は冗長である。

また名前なしパラメータは記述はシンプルだが、パラメータと値の対応関係がわかりにくく、パラメータの草原や順番の変化に影響を受けやすい。

### 否定の条件式を表す-not メソッド

NOT 条件を表現する

```rb
def not
  @books = Book.where.not(isbn: params[:id])
  render 'books/index'
end
```

```sql
SELECT `books`.* FROM `books` WHERE `books`.`isbn` != '978-4-7980-4803-1'
```

### 条件式を論理和で結合する-or メソッド

```rb
def where_or
  @books = Book.where(publish: '技術評論社').or(Book.where('price > 2000'))
  render 'hello/list'
end
```

```sql
SELECT `books`.* FROM `books` WHERE (`books`.`publish` = '技術評論社' OR (price > 2000))
```

or メソッドによって 2 個の ActiveRecord::Relation オブジェクトを結合する

ただし結合対象の ActiveRecord::Relation オブジェクトは互換性がなければならない。

したがって、両者は同じモデルで Where 条件式だけが異なる ActiveRecord::Relation でなければならない。

例えば

```rb
@books = Book.where(publish: '技術評論社').or(Book.where('price > 2000').limit(1))
```

はエラーになる。理由は Book.where(publish: '技術評論社')と Book.where('price > 2000').limit(1)では絞り込む数が等しくないので、条件に互換性がない

### データを並べ換える -order メソッド

取得したデータを特定のキーでならべかえる

```rb
def order
  @books = Book.where(publish: '技術評論社').order(published: :desc)
  render 'hello/list'
end
```

```sql
SELECT `books`.* FROM `books` WHERE `books`.`publish` = '技術評論社' ORDER BY `books`.`published` DESC
```

複数のソート式を与えてもよい

```rb
  @books = Book.where(publish: '技術評論社').order(published: :desc,price: :asc)
```

### ソート式を上書きする-reorder メソッド(知らなかった)

複数の order メソッドをメソッドチェーンした場合、Rails は両者を連結した ORDER BY 句を生成する

```rb
def reorder
  @books = Book.order(:publish).order(:price)
  render 'books/index'
end
```

```sql
SELECT `books`.* FROM `books` ORDER BY `books`.`publish` ASC, `books`.`price` ASC
```

しかし、以前のソート式を破棄して、新たにソート式を加えたい場合 reorder メソッドを使う

```rb
@books = Book.order(:publish).reorder(:price)
```

```sql
SELECT `books`.* FROM `books` ORDER BY `books`.`price` ASC
```

また単に前のソートを打ち消したい場合は reorder メソッドに nil を入れる

```rb
@books = Book.order(:publish).reorder(nil)
```

```sql
SELECT `books`.* FROM `books`
```

### 取得列を明示的に指定する-select メソッド

Active Record はデフォルトですべての列を取得しようとする

しかし巨大なテーブルで不要な列を無条件で取り出すのはメモリリソースの無駄遣い

select メソッドを使うことで取得列を明示的に指定できる

```ruby
def select
  @books = Book.where('price >= 2000').select(:title, :price)
  render 'hello/list'
end
```

```sql
SELECT `books`.`title`, `books`.`price` FROM `books` WHERE (price >= 2000)
```

### 重複のないレコードを取得する-distinct メソッド

distinct メソッドは、結果セットから重複した行を除去する。

books テーブルから重複のない出版社情報を取得する例

```rb
@pubs = Book.select(:publish).distinct.order(:publish)
```

```sql
SELECT DISTINCT `books`.`publish` FROM `books` ORDER BY `books`.`publish` ASC
```

### 特定範囲のレコードだけを取得する-limit/offset メソッド

limit メソッドと offset メソッドを組み合わせることで、特定範囲のレコードだけを取得することができる。

![スクリーンショット 2020-10-10 17.12.34.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/d855aa70-edfa-8f00-f4c5-9150f9a83c7f.png)

以下は 5 件目~7 件目を表示という意味

```rb
def offset
  @books = Book.order(published: :desc).limit(3).offset(4)
  render 'hello/list'
end
```

```sql
SELECT  `books`.* FROM `books` ORDER BY `books`.`published` DESC LIMIT 3 OFFSET 4
```

![スクリーンショット 2020-10-10 17.17.15.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/642c6ef9-a73b-60cd-454d-5f2405bbd744.png)

![スクリーンショット 2020-10-10 17.18.48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/4f179766-eec5-b9c2-4391-9d9ff853f327.png)

limit/offset をメソッドを利用することでページング処理を実装することができる。
例えば 3 件づつ表示する場合

```rb
def page
  page_size = 3 # ページ当たりの表示件数
  page_num = params[:id] == nil ? 0 : params[:id].to_i -1 # 現在のページ数
  @books = Book.order(published: :desc).limit(page_size).offset(page_size * page_num)
  render 'hello/list'
end
```

全件表示した場合

![スクリーンショット 2020-10-10 17.32.38 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/e365a657-589e-8f9a-6e4b-6bf9b1540366.png

2 ページ目を表示した場合(record/page/2)

```sql
SELECT  `books`.* FROM `books` ORDER BY `books`.`published` DESC LIMIT 3 OFFSET 3
```

![スクリーンショット 2020-10-10 17.33.13.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/b6173f60-8e53-5300-4c09-d8f011af6fea.png)

### 先頭/末尾のレコードを取得する-first/last メソッド

結果セットの先頭/末尾レコードを取得する場合、より直感的に利用できる first/last メソッドがある

刊行日(published 列)について降順に並べた時に末尾に来るレコードを取得するには以下のようにする。

```rb
def last
  @book = Book.order(published: :desc).last
  render 'books/show'
end
```

```sql
SELECT  `books`.* FROM `books` ORDER BY `books`.`published` ASC LIMIT 1
```

上記のように降順にしたときの末尾なので、自動的に最適化し、昇順にしたときの先頭を取得している。

ただ、「~.limit(3).last」のように limit メソッドと併用した場合は limit メソッドが優先される。

### データを集計する-group メソッド

特定のキーで結果をグループ化するには group メソッドを利用する。

books テーブルの内容を出版社(publish 列)でグループ化し、出版社ごとの価格の平均値を求める例

```rb
def groupby
  @books = Book.select('publish, AVG(price) AS avg_price').group(:publish)
end
```

```
<table>
  <tr>
    <th>出版社</th><th>価格</th>
  </tr>
  <% @books.each do |book| %>
    <tr >
      <td><%= book.publish %></td>
      <td><%= book.avg_price.round %>円</td>
    </tr>
  <% end %>
</table>
```

![スクリーンショット 2020-10-10 17.52.52.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ebdca437-4e96-344f-a419-865587b7f159.png)

SQL 関数は select メソッドから呼び出せる。

select メソッドの中で演算子や関数を利用した場合には、演算列にアクセスできるように AS 句で別名(エイリアス)を付与するのを忘れないようにしなければならない。

select メソッドで宣言されたエイリアスはもともと定義されていた列名と同じく「オボジェクト.エイリアス」の形式でアクセスできる。

```sql
SELECT publish, AVG(price) AS avg_price FROM `books` GROUP BY `books`.`publish`
```

### 集計結果をもとにデータを絞り込む-having メソッド

having メソッドを利用することで、集計した結果をもとに、さらにデータを絞り込むことも可能。

例えば group で集計された出版社の平均価格が 2500 円以上である情報を取得する例。

```rb
def havingby
  @books = Book.select('publish,AVG(price) AS avg_price').group(:publish).having('AVG(price) >= ?',2500)
  render 'record/groupby'
end
```

```sql
SELECT publish,AVG(price) AS avg_price FROM `books` GROUP BY `books`.`publish` HAVING (AVG(price) >= 2500)
```

### 条件句を破壊的に代入する-where!メソッド

Rails4 以降では条件式を破壊的に追加する where!などのメソッドを利用できる。

where!以外にも、order!、select!、limit!、offset!、group!、having!、distinct!などほとんどのクエリメソッドは「！」付きで呼び出すこともが可能。

これらを破壊クエリメソッドなどと呼ぶ。

破壊クエリメソッドを利用することで、複数の文で段階的に条件式を追加する場合にも、変数への再代入が必要ないため、コードをわずかにシンプルにできる。

```rb
def where2
  @books = Book.all
  @books.where!(publish: '技術評論社')
  @books.order!(:published)
  render 'books/index'
end
```

```sql
SELECT `books`.* FROM `books` WHERE `books`.`publish` = '技術評論社' ORDER BY `books`.`published` ASC
```

### クエリメソッドによる条件式を除去する-upscope メソッド

クエリメソッドはその場では実行されず、条件式を積み重ねて最終的に結果が必要になってはじめてクエリが実行される(遅延ロード)

実行するまえであれば、一度追加した条件式を取りけることができる。

where/order/select 条件のうち、where/select を除去する例

```rb
def unscope
  @books = Book.where(publish: '技術評論社').order(:price).select(:isbn, :title).unscope(:where. :select)
  render 'books/index'
end
```

```sql
SELECT `books`.* FROM `books` ORDER BY `books`.`price` ASC
```

where メソッドで複数の条件を追加した場合には、検索列の単位で女権を削除することができる。

```rb
def unscope2
  @books = Book.where(publish: '技術評論社', dl: true).order(:price).unscope(where: :dl)
  render 'books/index'
end
```

```sql
 SELECT `books`.* FROM `books` WHERE `books`.`publish` = '技術評論社' ORDER BY `books`.`price` ASC
```

ただし upscope 以降に追加された条件式は除外されない。

### 空の結果セットを取得する-none メソッド

none メソッドを呼び出すと空の結果セットを取得できる。

たとえば、ルートパラメータ経由で all、new、cheap いずれかのキーワードを与えると、「すべての書籍情報」「刊行日の新しい書籍 5 冊」「安い書籍 5 冊」を
それぞれ返す。

想定以外のキーワードを渡した場合は空の結果を返す。

```rb
def none
  case params[:id]
    when 'all'
      @books = Book.all
    when 'new'
      @books = Book.order('published DESC').limit(5)
    when 'cheap'
      @books = Book.order(:price).limit(5)
    else
      @books = Book.none
    end
  render 'books/index'
end
```

@books = Book.none を@books = nil にすると undefined method each for nil:NilClass のようなエラーが発生する。

エラーを回避するには each メソッドを呼び出す前に、変数@books の内容が nil であるかどうかを判定しなければならない。

しかし、none メソッドを利用することで、戻り値は Relation(NullRelation)オブジェクトとなる。

この場合中身がからなだけで、それ自体は結果セットなので、そのまま each メソッドを呼び出してもエラーにならない。

## データ取得のためのその他のメソッド

Active Record では、all/find/クエリメソッドさえ理解していれば、おおよその基本的な取得処理は賄えるはず。

知っておくと便利なメソッドを紹介する。

### 指定列の配列を取得する-pluck メソッド

pluck メソッドを利用することで、指定された列を配列として取得できる。

```rb
def pluck
  render plain: Book.where(publish: '技術評論社').pluck(:title, :price)
end
```

[["改訂新版 JavaScript 本格入門", 2980], ["Java ポケットリファレンス", 2680], ["Swift ポケットリファレンス", 2780], ["AngularJS アプリケーションプログラミング", 3700]]

### データの存在を確認する-exist?メソッド

データを取得するのではなく、指定されたデータが存在するかどうかだけを確認する場合、exist?メソッドを利用する。

たとえば、出版社(publish 列)が「新評論社」であるデータが存在するかどうかを確認するためのレコードは以下。

```rb
def exists
  flag = Book.where(publish: '新評論社').exist?
  render plain: "存在するか? : #{flag}"
end
```

```sql
 SELECT  1 AS one FROM `books` WHERE `books`.`publish` = '新評論社' LIMIT 1
```

存在チェックだけなので、実際に発行される SELECT 命令も最低限「与えられた条件で先頭の 1 件、ダミー列のみ」を取得している。

```rb
Book.exists?(1) # id値が1であるレコードが存在するか
Book.exists?(['price > ?', 5000]) # price列が5000より大きいレコードが存在するか
Book.exists?(publish: '技術評論社') # publish列が技術評論社のレコードが存在するか
Book.exists? #booksテーブルに1件でもデータが存在するか
```

### よく利用する条件句をあらかじめ準備する-名前付きスコープ

データベース検索のコードを記述していくと、同じような検索条件が登場する。

たとえばユーザーテーブルで性別(sex 列)や年齢(old 列)を管理しているとしたら、成人男性を取り出すために「old >= 20 AND sex = 'male'」のような条件式をなんども記述することになる。

そこで名前付きスコープを使う。

名前付きスコープは特定の条件式やソート式などをあらかじめモデル側で名前付けしておくことで、利用時に名前で呼び出せるようにする仕組み。

名前付きスコープを利用すると、呼び出しのコードがより直感的に記述でき、条件に変更があった場合にも修正箇所を限定できるというメリットがある。

![スクリーンショット 2020-10-10 23.08.28.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/6637af2f-4d97-4f2f-6b1c-b13a9aaae3d2.png)

- 技術評論社の書籍のみを取得する gihyo スコープ
- 刊行日の新しい順に並べる newer スコープ
- 刊行日の新しいものから先頭 10 件を取得する top10 スコープ

名前付きスコープはモデルクラス(この場合であれば Book クラス)で定義する

book.rb

```rb
class Book < ApplicationRecord
  scope :gihyo, -> { where(publish: '技術評論社')}
  scope :newer, -> { order(publish: :desc)}
  scope :top10, -> { newer.limit(10)}
end
```

![スクリーンショット 2020-10-10 23.15.14.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/45f8b11a-abce-980a-8aca-70f27aaae1b0.png)

名前付きスコープを定義できたら、コントローラ側から呼び出してみる。

```rb
def scope
  @books = Book.gihyo.top10
  render 'hello/list'
end
```

```sql
SELECT  `books`.* FROM `books` WHERE `books`.`publish` = '技術評論社' ORDER BY `books`.`publish` DESC LIMIT 10
```

定義済みのスコープをそのままメソッドチェーンとして連鎖させることができる。

何度も利用する条件式はできるだけスコープとしてまとめておくことで、コードを呼びやすくできる。

#### 名前付きスコープはパラメータ化も可能

名前付きスコープには引数を渡すこともできる。

```rb
scope :whats_new, ->(pub) {where(publish: pub).order(published: :desc).limit(5)}
```

whats_new スコープは以下のように呼び出せるので、似たような条件句がある場合に、パラメータ化することでスコープを定義せずに済む。

```rb
@books = Book.whats_new('技術評論社')
```

```sql
SELECT  `books`.* FROM `books` WHERE `books`.`publish` = '技術評論社' ORDER BY `books`.`published` DESC LIMIT 5
```

### デフォルトのスコープを定義する-default_scope メソッド

よくある抽出/ソート条件に名前を付けて、モデル呼び出しのコードをわかりやすくる名前付きスコープに対して、モデル呼び出しの際にデフォルトスコープという機能もある。

たとえばレビュ情報(reviews テーブル)の内容を常に投稿日降順で取り出すのであれば、これを毎回、呼び出しのコードで指定するのは面倒。

しかし、デフォルトスコープを利用すれば、指定された条件が必ず適用されるので、呼び出しのコードがシンプルになる。

reviews テーブルに対して投稿日の降順というデフォルトスコープを適用し、アクションメソッドから実際に呼び出す例。

review.rb

```rb
default_scope { order(updated_at: :desc) }
```

```rb
render plain: Review.all.inspect
```

```sql
SELECT  `reviews`.* FROM `reviews` ORDER BY `reviews`.`updated_at` DESC LIMIT 11
```

updated_at: :desc というソート式を指定しているので、Review.all と指定しても、SQL 命令には自動的に OREDER BY 句が追加される。

デフォルトスコープで指定された条件式は、個別の問い合わせで order/where メソッドを指定した場合でも取り消されることはない。

個別の問い合わせで指定された条件は、order メソッドであれば第 2 キー以降に追加されるだけ、また where メソッドであれば AND 演算子で追加される。

### 検索結果の行数を取得する-count メソッド

```rb
def count
  cnt = Book.where(publish: '技術評論社').count
  render plain: "#{cnt}件です."
end
```

```sql
SELECT COUNT(*) FROM `books` WHERE `books`.`publish` = '技術評論社'
```

### コードの平均や最大/最小を求める

count メソッドの仲間で以下のようなメソッドも用意されている。

| メソッド     | 概要   |
| ------------ | ------ |
| average(col) | 平均値 |
| minimum(col) | 最小値 |
| maximum(col) | 最大値 |
| sum(col)     | 合計値 |

平均値の例は以下。

```rb
def average
  price = Book.where(publish: '技術評論社').average(:price)
  render plain: "平均価格は#{price}円です。"
end
```

```sql
SELECT AVG(`books`.`price`) FROM `books` WHERE `books`.`publish` = '技術評論社'
```

### 生の SQL 命令を直接指定する-find_by_sql メソッド

ActiveRecord では原則、まずクエリメソッドを利用するべき。

あまりにも複雑な問い合わせは生の SQL 命令で記述した方がかえって分かりやすいという場合がある。

そのようなケースでは find_by_sql メソッドで書き換えた例。

```rb
def literal_sql
  @books = Book.find_by_sql(['SELECT publish, AVG(price) AS avg_price FROM books GROUP BY publish HAVING AVG(price) >=?', 2500])
  render 'record/groupby'
end
```

find_by_sql は SQL 命令に精通した人にとっては、手軽に感じるかもしれない。

ただし、Rails ではまずクエリメソッドを利用するのが基本。

find_by_sql メソッドを利用することは、それだけの特定のデータベースに依存する原因になることを理解しなければならない。

## レコードの登録/更新/削除

INSERT(追加)/UPDATE(更新)/DELETE(削除)処理を行う。

### 複数のレコードをまとめて更新する-update_all メソッド

update_all メソッドを利用すると、特定の条件に合致するレコードをまとめて更新できる

```rb
def update_all
  cnt = Book.where(publish: '技術評論社').update_all(publish: 'Gihyo')
  render plain: "#{cnt}件のデータをこうしんしました。"
end
```

```sql
UPDATE `books` SET `books`.`publish` = 'Gihyo' WHERE `books`.`publish` = '技術評論社'
```

order/limit メソッドを併用することで、「特定の並び順で先頭 n 件のみを更新する」という操作も可能。

たとえばリスト 5-37 は、刊行日(publish 列)が古いもの 5 件について、価格(price 列)を 2 割引きする例。

```rb
def update_all2
  cnt = Book.order(:published).limit(5).update_all('price = price * 0.8')
  render plain: "#{cnt}件のデータを更新しました。"
end
```

```sql
UPDATE `books` SET price = price * 0.8 ORDER BY `books`.`published` ASC LIMIT 5
```

### レコードを削除する-destroy/delete メソッド

Rails では既存レコードを削除するためのメソッドとして、destroy メソッドと delete メソッドというよく似た 2 種類のメソッドを用意している。

destroy メソッドは books_controller.rb にて以下のように定義した。

```rb
def destroy
  @book.destroy
end
```

上記はいったんオブジェクトを取得してから削除処理を行うが、これは削除したモデルの内容をあとから参照できるようにするための措置。

もしオブジェクトが不要であるなら、destory をクラスメソッドとして呼び出しても構わない。

```rb
def destory
  Book.destory(params[:id])
end
```

この場合、内部的には SELECT→DELETE の順で処理が行われる。

```sql
SELECT "books".*FROM "books" WHERE "books"."id" = ? LIMIT ? [["id",11],["LIMIT",1]]
DELETE FROM "books" WHERE "books"."id" = ? [["id",11]]
```

もう一つ delete メソッドも利用してみる

```rb
def destroy
  Book.delete(prams[:id])
end
```

```sql
DELETE FROM "books" WHERE "books"."id" = ? [["id",12]]
```

レコードを削除するという結果は同じだが、SQL 命令のレベルで見てみると、destory メソッドは SELECT→DELETE の順で、delete メソッドは DELETE のみが実行されていることが確認できる。

これはアソシエーションやコールバックという機能を利用したときに現れる。

Acitve Record の機能をきちんと利用したい場合には destroy メソッドを、単純にデータを削除のみを行いたい場合は delete メソッドを利用する使い方になる。

delete メソッドの制約を理解していないうちは、destroy メソッドを優先して利用すること。

### 複数のレコードをまとめて削除する-destory_all メソッド

destory_all メソッドは、特定の条件に合致するレコードをまとめて削除する。

```rb
def destroy_all
  Book.where.not(publish: '技術評論社').destroy_all
  render plain:'削除完了'
end
```

```sql
SELECT "books".*FROM "books" WHERE ("books"."publish"!=?)[["publish","技術評論社"]]
begin transaction
DELETE FROM "books" WHERE "books"."id" = ? [["id",2]]
commit transaction
begin transaction
DELETE FROM "books" WHERE "books"."id" = ? [["id",4]]
...
```

※ Review モデルと Book モデルはリレーションの関係があるので、Book モデルに has_many :review に dependent: :destroy を記述しなければエラーになる。

### トランザクション処理を実装する-transaction メソッド

トランザクション処理とは、ひとかたまりの処理のこと。

一連の処理が全て成功すればトランザクション処理は成功し、1 つでも失敗すればトランザクション処理は失敗し、それまでに行われた処理も全て無効になる。

たとえば銀行でのお金の振込を単純化すると。

- 振り込み元口座からの出勤
- 振り込み先口座への入金

から成り立っている。

このような振り込み処理で、出勤には成功したのに(通信の障害などが原因で)入金に失敗してしまったとしたらどうか。

振り込み元口座の残高は減っているのに、振り込み先口座の残高は減っているのに、振り込み先口座の残高は増えないという、おかしな状況になる。

このような不整合はシステム的にあってはならない問題。

入金/出勤という 2 つの処理は「両方成功」するか、「両方失敗」しなければならない。

つまり、入金と出金は関連するひとまとまりの処理、すなわちトランザクションとして扱うべき処理となる。

### 同時実行制御

一般的に web アプリでは同一のレコードに対して複数のユーザーが同時に更新しようとする状況が頻繁に発生する。

![スクリーンショット 2020-10-11 20.52.00.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/be8f490c-0775-14f2-74aa-8c1b0e875de3.png)

ユーザー A/B が同一のレコードを同時に取得している。

この状態でユーザー A→B の順でレコードを更新したらどうなるか。

ユーザー A の変更はなかったものとして無視される。

他のユーザーはもちろん、ユーザー B もユーザ-A による変更があったことを知るすべがない。

このような状況のことを更新の競合という。

Active Record ではこのような競合の発生を防ぐためにオプティミスティック同時実行制御(楽観的同時実行制御)という機能を用意している。

#### 1.テーブルに lock_version 列を追加する

Active Record には、行単位にバージョン番号を持たせることで、更新(競合)の有無を検出するしくみがある。

この場合、対象のテーブルにも、あらかじめバージョンを管理するための lock_version 列を加えておく必要がある。

例えば、以下のような members テーブルを作成する。

| 列名         | データ型 | 概要           |
| ------------ | -------- | -------------- |
| name         | string   | 氏名           |
| email        | string   | メールアドレス |
| lock_version | integer  | バージョン番号 |

Scaffolding 機能を利用して members テーブルを作成する。

```
rails g scaffold member name:string email:string lock_version:integer
```

lock_version 列にはデフォルト値としてあらかじめ 0 をセットしておかなけらばならない。

```rb
class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.integer :lock_version, default: 0

      t.timestamps
    end
  end
end
```

マイグレーションファイルを実行する。

```
rails db:migrate
```

#### 2.オプティミスティック同時実行制御を実装する

オプティミスティック同時実行制御を利用するには、自動生成されたアプリの

app/views/members/\_form.html.erb を以下のように編集する。

```
<% form.hidden_field :lock_version %>
上記を追加
以下を削除
<div class="field">
  <%= form.label :lock_version %>
  <%= form.number_field :lock_version %>
</div>
```

lock_version 列の値を隠しフィールドとして受け渡す。

#### 3.オプティミスティック同時実行制御の挙動を確認する

同じレコードに対するメンバー更新画面を 2 つのブラウザーで開いた上で順に更新処理を行う。

すると、あとから更新処理を実行した方のブラウザーでは、エラーが表示される。

![スクリーンショット 2020-10-11 21.58.01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/bc1a2d99-01a5-ada7-ae5d-2270473eb69d.png)

このように、オプティミスティック同時実行制御では「たぶん競合は起こらないであろう」ことを前提に、データ取得時には何もせずに、更新時に競合をチェックするのが特徴。

それが Optimistic(楽観的)と呼ばれている理由である。

コンソールから SQL を開き lock_version 列がインクリメントされていることを確認する。

```sql
SELECT lock_version FROM members WHERE id = 1;
1
```

lock_version 列は行のバージョンを管理するための列。

Active Record ではデータ取得時のバージョンと更新時のバージョンを比較し、双方が異なっている場合には他のユーザーが更新してしまったとみなし、

競合エラーを発生している。

正しく更新できた場合には lock_version 列をインクリメントし、バージョンを進める。

![スクリーンショット 2020-10-11 22.12.29.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/cee02bb5-4f99-d493-1559-8a2b9a908c33.png)

#### 4.例外検出時のコードを記述する

以上で、最低限のオプティミスティック同時実行制御は動作しているが、例外メッセージがそのまま表示されるのは好ましくないので、例外処理を追加する。

```rb
def update
  respond_to do |format|
    if @member.update(member_params)
      format.html { redirect_to @member, notice: 'Member was successfully updated.' }
      format.json { render :show, status: :ok, location: @member }
    else
      format.html { render :edit }
      format.json { render json: @member.errors, status: :unprocessable_entity }
    end
  end
  rescue ActiveRecord::StaleObjectError
  render plain: '競合エラーが発生しました。'
end
```

この状態で同時更新すると競合発生時にエラーメッセージが表示されるようになる。

![スクリーンショット 2020-10-11 22.17.25.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/17267a54-8d6a-1dd3-7b34-30ae456727c0.png)

#### オプティミスティックがうまく動作しない場合

以下のような原因が考えられる。

1. lock_version 列に初期値 0 がセットされていない

1. lock_version 列の値がフォームパラメーターとして送信されていない

1. 設定ファイルで config.active_record.lock_optimistically パラメータが false になっている

### 列挙型のフィールドを定義する-Active Record enums

特定の数値リストに意味を持たせて、データベースに保存したいということはよくない。

reviews テーブルの status フィールドがその列。

status は integer 型の列で、それぞれの値が以下のような意味を持つとする。

| 値  | 意味              |
| --- | ----------------- |
| 0   | 下書き(draft)     |
| 1   | 公開済(published) |
| 2   | 削除済(deleted)   |

このようなフィールドを操作する際に、0,1,2 という便箋的な数値で操作するよりも、draft、published,deleted のようなキーワードで操作/参照できた方がコードの可読性は改善する。

そのような状況で利用するのが、Active Record enums。

##### 1.status フォールドの初期値を設定する

rails generate コマンドで自動生成したマイクレーションファイルは、ほとんどそのまま利用できるが、最低限、Active Record enums を適用するフィールド(status)にはデフォルト値として 0 をセットしておく必要がある。

```rb
class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :body

      t.timestamps
    end
  end
end
```

##### 2.status フォールドに列挙体を定義する

以下のように列挙体を定義する。

```rb
class Review < ApplicationRecord
  # enum型
  enum status: { draft:0, published:1, deleted:2 }
end
```

##### 3.Active Record enums を利用して status フィールドにアクセスする

```rb
def enum_rec
  @review = Review.find(1)
  @review.published!
  render plain: 'ステータス:' + @review.status
end
```

```sql
UPDATE `reviews` SET `status` = 1, `updated_at` = '2020-10-11 13:46:19' WHERE `reviews`.`id` = 1
```

Acitive Record enums では、published!、draft!、deleted!のような「enum で定義したキーワード+!」の形式で、status フィールドを設定できる。

また status フィールドにアクセスした場合にも、戻り値は(数値ではなく)キーワードである点に注目。

また@review.published?とすることで、現在のステータス値が published であるかどうかを true/false で得ることもできる。

#### Active Record enums のさまざまな記法

enum の記法には様々な定義の仕方がある。

##### 1.列挙値は配列としても定義できる

```rb
enum status: [:draft, :published, :deleted]
```

この場合、データベースには配列のインデックス値がセットされる。

0 スタートの列挙値を定義するならば、配列を利用するとコードがシンプルになる。

ただし、数値を自分で設定できないため、あとから列挙値を追加/削除した場合、既存の値がずれる可能性がある。

一般的には列挙値はハッシュで定義するのが安全。

##### 2.列挙値をスコープとして利用する

たとえば以下のようにするとスタータスが pbulished であるレビューだけ取得できる

```rb
@reviews = Review.published
```

この場合の published はスコープとして扱えるので、クエリメソッドを繋げることも可能。

```rb
@reviews = Review.published.where('updated_at < ?', 6.months.ago)
```

##### 3.不正な値も削除できる

draft!、pubulished!、deleted!のような更新メソッドを利用する他、シンプルに status フィールドに値を設定することもできる。

```rb
@review.status = 1
@review.status = :published
```

ただし、この場合、列挙値として定義されていない値が設定されると、ArgumentError 例外が発生する。

```
ArgumentError: 'publi' is not a valid status
```

### その他の更新系メソッド

![スクリーンショット 2020-10-11 22.17.25.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/68ceb7d6-997f-a915-dbf4-5a88f1d28850.png)
