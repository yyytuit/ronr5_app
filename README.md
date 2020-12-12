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

## 検証機能の実装

エンドユーザーから入力された値は、まず「正しくないこと」を前提に、アプリは実装されるべき。

善意悪意に関係なく、ユーザーとは間違える生き物だから。

不正な値によってアプリが予期せぬ動作をしたり、例外でクラッシュしてしまったという状況は絶対に避けなければならない。

また悪意あるユーザーが意図的に不正な値を入力することで、データを盗聴/破壊しようと試みるケースも少なくない。

入力値を検証することは攻撃リクスを最小限に抑えるセキュリティーの一環でもある。

もっとも、このような検証機能を 1 から実装するのは、なかなか面倒。

Active Model の Validation 機能を利用することで、必須検証や文字列検証、正規表現検証のようにアプリでよく利用するような検証処理をシンプルなコードで実装できるようになる。

### Active Model で利用できる検証機能

| 検証名       | 検証内容<br>パラメータ                                      | エラーメッセージ<br>意味                           |
| ------------ | ----------------------------------------------------------- | -------------------------------------------------- |
| acceptance   | チェックボックスにチェックが入っているか。                  | must be accepted                                   |
|              | accept                                                      | チェック時の値(デフォルトは 1)                     |
| confirmation | 2 つのフィールドが正しいか                                  | doesn't match confirmation                         |
|              | -                                                           | -                                                  |
| exclusion    | 値が配列/範囲に含まれていないか                             | is reserved                                        |
|              | in                                                          | 比較対象の配列、または範囲オブジェクト             |
| inclusion    | 値が配列/範囲に含まれいるか                                 | is not included in the list                        |
|              | in                                                          | 比較対象の配列、または範囲オブジェクト             |
| format       | 正規表現パターンに合致しているか                            | is invalid                                         |
|              | with                                                        | 正規表現パターン                                   |
| length       | 文字列の長さ(範囲/完全一致)をチェック                       | is too short (minimun is xxx characters)           |
|              | minimun                                                     | 最小の文字列長                                     |
|              | maximum                                                     | 最大の文字列長                                     |
|              | in                                                          | 文字列長の範囲(range 型)                           |
|              | tokenizer                                                   | 文字列の分割方法(ラムダ式)                         |
|              | is                                                          | 文字列長(長さが完全に一致していること)             |
|              | too_long                                                    | maximum パラメーターに違反した時のエラーメッセージ |
|              | too_short                                                   | minimum パラメータに違反した時のエラーメッセージ   |
|              | wrong_length                                                | is パラメーターに違反した時のエラーメッセージ      |
| numericality | 数値の大小/型をチェック(チェック内容はパラメーターで指定可) | is not a number                                    |
|              | only_integer                                                | 整数であるか                                       |
|              | greater_than                                                | 指定値より大きいか                                 |
|              | greater_than_or_equal_to                                    | 指定値以上か                                       |
|              | equal_to                                                    | 指定値と等しいか                                   |
|              | less_than                                                   | 指定値未満か                                       |
|              | less_than_or_equal_to                                       | 指定値以下か                                       |
|              | odd                                                         | 奇数か                                             |
|              | evern                                                       | 偶数か                                             |
| presence     | 値が空でないか                                              | can't be empty                                     |
|              | -                                                           | -                                                  |
| absence      | 値が空であるか                                              | must be blank                                      |
|              | -                                                           | -                                                  |
| uniqueness   | 値が一意であるか                                            | has already been taken                             |
|              | scope                                                       | 一意性制約を決めるために使用する他の列             |
|              | case_sensitive                                              | 大文字小文字を区別するか(デフォルトは true)        |

### 検証機能の基本

以下の検証ルールを実装する。

| フィルド | 検証ルール                                                                                            |
| -------- | ----------------------------------------------------------------------------------------------------- |
| isbn     | 必須検証/一意検証/文字列長検証(17 文字)/正規表現検証([0-9]{3}-[0-9]{1}-[0-9]{3,5)-[0-9]{4}-[0-9X]{1}) |
| title    | 必須検証/文字列検証(1~100 文字)                                                                       |
| price    | 数値検証(整数/10000 未満)                                                                             |
| publish  | 候補値検証(技術評論社/翔泳社/秀和システム/日経 BP 社/ソシムのいずれか)                                |

#### 1.モデルクラスに検証ルールを定義する

```rb
class Book < ApplicationRecord
  # バリデーション
  validates :isbn,      presence: true,
                        uniquneess: true,
                        length: { is: 17 },
                        format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5)-[0-9]{4}-[0-9X]{1}\z/}
  validates :title,     presence: true,
                        length: { minimum: 1, maximum: 100 }
  validates :price,     numericality: { only_integer: true, less_than: 1000}
  validates :publish,   inclusion: { in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム']}
end
```

検証ルールを宣言するのは、validates メソッドの役割。

validates :first_name, :last_name,...

のように複数のフィールドに対してまとめて検証ルールを適用することもできる。

複数のフィールドが同一の検証ルールを持つ場合には、このように記述したほうがコードはシンプルになる。

引数 name と params には検証ルールをハッシュ形式で指定する。

検証パラメータが不要である場合には、検証を有効にする意味で true とだけ指定する。

例えば presence: true のような  場合。

#### 2.検証を実行する

検証はデータの保存時に自動的に行われる。

create アクションであれば、save メソッドが呼び出されるタイミングで入力値の検証が実施される。

save メソッドは検証が成功した場合にのみ保存処理を行い、失敗した場合には保存処理を中断し、戻り値として false を返す。

そのため、アクションメソッド側では save メソッドの戻り値に応じて結果処理を分岐すれば良い。

また save メソッドの他にも検証処理は以下のメソッドを実行するさいに行われる。

- create
- create!
- save
- save!
- update
- update!

逆に以下のメソッドでは検証処理がスキップされ、値の正否に関わらず、オブジェクトはそのままデータベースに反映される。

- decrement! (特定のレコードの値を減らす)
- decrement_counter
- increment! (特定のレコードの値を増やす)
- increment_counter
- toggle! (boolean カラムの値を反転させる)
- touch (updated_at を現在時刻でアップデートできる)
- update_all
- update_attribute
- update_couters
- update_column (updated_at の値を更新せず、値を上書きしたい時に使う)
- save(validate: false)

##### 任意のタイミングで検証する

valid? メソッドを利用することでデータベースへの保存とは別に検証処理だけを独立して実行することができる。

railse 'エラー発生' unless @book.valid?

#### 3.検証エラーを表示する

```ruby
<% if book.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(book.errors.count, "error") %> prohibited this book from being saved:</h2>

    <ul>
    <% book.errors.full_messages.each do |message| %>
      <li><%= message %></li>
    <% end %>
    </ul>
  </div>
<% end %>
```

検証エラーに関する情報を取得しているのは、モデルオブジェクトの errors メソッド。

errors メソッドは戻り値を ActiveSupport::OrderHash オブジェクトとして返すので、OrderedHash#any?メソッドを呼び出して、エラーの有無をチェックしている。

エラーが存在する場合は配下のブロックでエラーメッセージをリスト表示する。

count メソッドでエラー数を取得し、表示している。

ビューヘルパー pluraize は与えられた数値によって単数系/複数形の単語を返すメソッド。

最後に full_messages メソッドは格納されている全てのエラーメッセージを配列として返す。

#### 4.エラー表示関連のスタイルを確認する

対象要素を表す<label>/<input>要素が<div>要素によって囲まれる。

```html
<div class="field">
  <div class="field_with_erros"><label for="book_isbn">Isbn</label></div>
</div>
```

<div>要素にはclass属性(値は"field_with_erros")が付与される。

Scaffolding 機能で自動生成されるスタイルシート

```css
.field_with_errors {
  padding: 2px;
  background-color: red;
  display: table;
}
```

デフォルトでは背景色が赤く染まる設定だが、お世辞にもクールとは言えないデザイン。

### その他の検証クラス

#### acceptance 検証\_受託検証

aceptance 検証は、ユーザーが利用規約などに同意しているかを検証するために利用する。

他の検証と異なる点は、acceptance 検証ではデータベースに対応するフィールドを用意する必要がない。

「同意」という行為はあくまでデータ登録時にチェックするだけの用途で、データベースに保村する必要ないため。

![スクリーンショット 2020-10-27 2.50.24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/6960dd34-57c3-cf67-5843-a7db56b0db1b.png)

acceptance 検証ではテーブルに対応するフィールドを設置する必要がない。

acceptance 検証を宣言したところで、対応する仮装フィールド(:agreement)が内部的に自動生成されるため。

仮装フィールドはあくまで検証のためにのみ利用される。

ちなみに、acceptance 検証ではチェックボックスのチェックの時の値を表す accept パラメータを指定することもできる.

```rb
<%= f.check_box :agreement, {}, 'yes' %>
```

のようにチェックボックスが設置されていたとしたら、モデル側では

```rb
validates: agreement, acceptance: { accept: 'yes'}
```

のように対応する値を受け取れるようにしておく必要がある。

#### confirmation 検証-同一検証

confirmation 検証はパスワードやアドレスなど重要な項目のために 2 回入力させる場合に、両者がひとしいかどうかを確認する。

acceptance 検証と同じく、確認用のフィールドは仮想的に準備されるので、データベースに対応するフィールドを用意しなくていい。

users_controller.rb

```rb
params.require(:user).permit(:username, :password, :email, :email_confirmation, :dm, :roles, :agreement)
      #params.require(:user).permit(:username, :password, :password_confirmation, :email, :email_confirmation, :dm, :roles, :agreement)
```

user.rb

```rb
validates :email, confirmation: true
```

users/\_form.html.erb

```rb
<div class="field">
    <%= f.label :email_confirmation %><br />
    <%= f.text_field :email_confirmation %>
</div>
```

![スクリーンショット 2020-11-14 12.58.16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/491c91be-5ab9-fb16-91e9-ab68e9e22933.png)

#### uniquness 検証 一意性検証

uniquness 検証は、指定されたフィールドの値が一意であるかどうかをチェックする。

発行される SQL

```sql
SELECT 1 AS one FROM "books" WHERE "books"."isbn" = ? LIMIT ? [["isbn","978-4-7741-8411-1"],["LIMIT",1]]
```

状況によって複数のフィールドで一意になるようにチェックしたい場合

例えば、books テーブルで署名(title 列)と出版社(publish 列)で一意になるように検証したいという場合

book.rb

```rb
validates titel:, uniqueness: { scope: :publish}
```

発行される SQL

```sql
SELECT 1 AS one FROM "books" WHERE
"books"."title" = ? AND "books"."publish" = ?
LIMIT ? [["title", "改定新版JavaScript本格入門"],["publish","技術評論社"],]
```

### 検証クラス共通のパラメータ

検証クラスには追加で以下のようなパラメータがある。

| パラメータ  | 概要                                   |
| ----------- | -------------------------------------- |
| allow_nil   | nil の場合、検証をスキップ             |
| allow_blank | nil と空白の場合、検証をスキップ       |
| message     | エラーメッセージ                       |
| on          | 検証のタイミング。デフォルトは save 時 |
| if          | 条件式が true の場合にのみ検証を実施   |
| unless      | 条件式が false の場合にのみ検証を実施  |

#### 空白時に検証をスキップする allow_nil/allow_blank パラメータ

任意入力の項目全ての検証が実行されてしまうのは望ましくない。

また、必須項目でも必須検証が適用されているならば、未入力時に他の検証エラーまで出力されるのは冗長

そこで使われるのが allow_nil/allow_blank パラメータ

これらのパラメータを有効(true)にしておくと、対象の項目が空である場合に検証をスキップさせることができる

検証結果が必須エラーのみに限定される
![スクリーンショット 2020-11-14 13.38.55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/41352634-ca6f-2ff0-1f11-ca2481a87a6d.png)

#### 検証タイミングを制限する on パラメーター

検証クラスはデフォルトでデータ保存時に入力値を検証する。

ただ、検証の種類によっては、データの新規登路/更新いずれかのタイミングでのみ処理を行たいというケースもある。

たとえば、規約同意の有無(acceptance)をチェックしたが、これは一般的にはユーザー情報には不要なチェック

しかし、現状では更新時に acceptance 検証が働いてしまう。

そこで on パラメータを利用することで、検証発生タイミングを制限する。

on パラメーターの設定値
| 設定値 | 概要 |
| ----------- | -------------------------------------- |
| create | 新規登録時のみ |
| update | 更新時のみ |
| save | 新規登録/更新時の双方(デフォルト) |

user.rb

```rb
validates :agreement, acceptance: { on: create}
```

#### エラーメッセージを修正する message パラメータ

検証クラスが生成するデフォルトのエラーメッセージは英語。

検証機能を利用するうえで、最低でもエラーメッセージを日本語にしたい。

エラーメッセージを修正する最も手軽な方法は、message オプションを指定すること

![スクリーンショット 2020-11-15 9.09.02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/ac1e736f-cc24-c948-b788-6ef097332146.png)

#### 条件付きの検証を定義する if/unnless パラメーター

特定の条件配下でのみジックすべき検証を定義するには、if/unless パラメータを使用する。

例えば、ユーザー登録画面で「メール通知を有効化」dm 欄にチェックした場合のみ、メールアドレスを必須にする。

user.rb

```rb
validates :email, presence: { if: '!dm.blank?' }
```

「dm フィールドが空(blank?)でなければ、presence 検証を有効にしなさい」という意味になる。

if/unless オプションには文字列で条件式を指定する他、シンボル、proc オブジェクトで指定する方法もある。

シンボルを使用

```rb
validates :email, presence: { unless: :sendmail? }
  def senmail?
    dm.blank?
  end
end
```

シンボルではシンボルに対応するメソッドを定義する必要がある。

prock を使用

```rb
validates :email, presence: { unless: Proc.new {|u| u.dm.blank? } }
```

プロックでは引数として現在のモデルオブジェクトが引数 u で渡されるので、これをもとに処理する。

一般的にはシンボル指定を利用し、シンプルな条件指定では文字列または Proc オブジェクトをという使い分けをする。

##### 複数項目にまとめて条件を指定する

特定の条件を満たした場合、まとめて複数の検証を有効にしたいというケースもある。

そのようなときに with_options メソッドを利用することで、条件式をまとめて記述できる

たとえば「メール通知を有効化」(dm)欄をチェックした場合にのみメールアドレス/ロール欄を必須にする例。

user.rb

```rb
with_options unless: 'dm.blank?' do |dm|
  dm.validates :email, presence: true
  dm.validates :roles, presence: true
end
```

### 自作検証クラスの定義

Active Model では標準でも様々な検証クラスを提供しているが、本格的にアプリを構築する上では、標準の検証機能だけでまかなえない部分もある。

そのような場合に検証クラスを自作する。

#### パラメーターを持たない検証クラス

ISBN コードの妥当性を検証するための IsbnValidator クラスを定義してみいる。

検証クラスは/app/models フォルダーに配置する

isbn_validator.rb

```rb
class IsbnValidator < ActiveModel::EachValidator
  #パラメーターを受け取らない検証クラス
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'は正しい形式ではありません。') unless value =~ /\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
  end
end
```

検証クラスは ActiveModel::EachValidator の派生クラスとして(1)、「検証 Validator」のん形式で命名する必要がある。

ActiveModel::EachValidator は検証クラスの基本機能を提供するクラス

検証クラスの実処理を定義するには、validate_each メソッドを使う。

validate_each メソッドは引数として、

- 検証対象のモデルオブジェクト(record)
- 検証対象のフィールド名(attribute)
- 検証対象の値(value)

を受け取る。

メソッド配下では、これらの値を利用して、実際の検証処理を行う。

検証時に発生したエラー情報は errors.add メソッドを介してモデルオブジェクト record に登録する必要がある。

この例では入力値 value をあらかじめ与えられた正規表現パターン(ISBN コードの形式)と比較し、合致しない場合にエラーメッセージを登録する。

検証クラスの準備ができると、これを利用するのは簡単。

Book クラスの isbn フィールドに適用した format 検証を IsbnValidator クラスによる検証で置き換えする。

IsbnValidator であれば isbn、EmailAddressValidator であれば email_address が検証名となる。

isbn 検証は特にパラメーターを受け取らないので、最低限 ture を引き渡せば呼び出せる。

```rb
    3: def validate_each(record, attribute, value)
    4:   binding.pry
 => 5:   record.errors.add(attribute, 'は正しい形式ではありません。') unless value =~ /\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
    6: end

[1] pry(#<IsbnValidator>)> record
=> #<Book:0x00007f4650ac1988
 id: nil,
 isbn: "ewuriwouriwquiu",
 title: "",
 price: nil,
 publish: "",
 published: Fri, 20 Nov 2020,
 dl: false,
 created_at: nil,
 updated_at: nil>
[2] pry(#<IsbnValidator>)> attribute
=> :isbn
[3] pry(#<IsbnValidator>)> value
=> "ewuriwouriwquiu"
```

#### パラメータを受け取る検証クラス

パラメータ情報を受け取る検証クラスを定義する。

先ほどの isbn 検証を改良し、allow_old パラメータを受け取れるようにする。

allow_old パラメータに true が渡された場合に、isbn 検証は古い形式の ISBN コードも許可する。

isbn_validator.rb

```rb
# パラメーターを受け取る検証クラス
  def validate_each(record, attribute, value)
    if options[:allow_old]
      pattern = '\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z'
    else
      pattern = '\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z'
    end
    record.errors.add(attribute, 'は正しい形式ではありません。') unless value =~ /#{pattern}/
  end
```

book.rb

```rb
isbn: { allow_old: true}
```

パラメータ情報には「options[パラメータ名]でアクセスできる。

allow_ald パラメータが true/false いずれであるかによって、旧形式/新形式の正規表現パターンをセットし、入力値 value と比較している。

#### 複数項目をチェックする検証

複数の項目にまたがる検証も表現できる

他のフィールド値との比較検証を実装する例。

compare 検証のパラメータ情報
| 設定値 | 概要 |
| ----------- | -------------------------------------- |
| compare_to | 比較フィールドの名前 |
| type | 比較の方法(:less_than、:greater_than、:equal) |

compare_validator.rb

```rb
class CompareValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cmp = record.attributes[options[:compare_to]].to_i
    case options[:type]
      when :greater_than
        record.errors.add(attribute, 'は指定項目より大きくなければなりません。')unless value > cmp
      when :less_than
        record.errors.add(attribute, 'は指定項目より小さくなければなりません。')unless value < cmp
      when :equal
        record.errors.add(attribute, 'は指定項目と等しくなければなりません。')unless value == cmp
      else
        raise 'unknown type'
    end
  end
end
```

指定されたフィールドの値を現在のモデルから取得するのは、attribute メソッドの役割。

これまでは、record.title のようにプロパティ構文を利用してきたが、この例では利用できない。

理由はフィールド名が、:compare_to パラメータ経由で文字列として渡されるから。

このような場合には attributes メソッドを利用することで、取得するフィールド名を文字列で指定できるようになる。

ここでは:compare_to パラメータ経由で渡されたフィールドの値を取得し、to_i メソッドで整数値に変換している。

値を取得できてしまえば、case ブロックで:type パラメータに応じて値を比較するだけ。

例えば compare 検証を利用するには、min_value フィールドが max_value フィールドより小さいことを検証するなど

```rb
validates :min_value,
  compare: { compare_to: 'max_value', type: :less_than}
```

#### 検証クラスを定義せずにカスタム検証を定義

カスタムの検証ルールは、まず ActiveModel::EachValidator クラスを検証して実装するのが基本。

他のモデルで使いまわさないようなモデル固有の検証ルールなどは、あえてクラスとして定義するまでもないということもある。

そのような場合にはモデルの中でプライベートメソッドとして検証ルールを定義することもできる。

book.rb

```rb
errors.add(attribute, 'は正しい形式ではありません。') unless value =~ /\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
```

### データベースんい関連づかないモデルを定義する ActiveModel::Model モジュール

ActiveModel とはモデルの基本的な構造や規約を決定するコンポーネント。

ActiveModel の機能を直接利用することで、データベースと対応関係にないモデルを実装することもできる。

たとえば「データベースの項目ではないが、フォームからの入力を受け取って検証を行う」必要があるような処理を、(アクションメソッドを検証処理で汚すことなく)モデルクラスとしてまとめるような用途で利用する。

例としては検索フォームを想定したサンプルで、ページから入力された検索キーワードを SerchKeyword モデルとしてまとめ、必須検証を実装している。

```rb
class SearchKeyword
include ActiveModel::Model
attr_accessor :keyword
validates :keyword, presence: true
end
```

非データベース系のモデルを定義する際のルールは以下

1. ActiveModel::Model モジュールをインクルードすること
1. モデルとして管理すべき項目をアクセサー(attr_accessor メソッド)で定義

この例では検索キーワードを表す keyword プロパティを定義している.

もちろん必要に応じて複数の項目を列記しても構わない。

以上のように書くことで、validates メソッドが使える。

#### 非データベース系のモデルを利用する

作成した SearchKeyword モデルは、これまでと同じ方法で利用できる。

本来であれば、検索キーワードを受け取った後、データベースへの検索などの処理が発生するはず。

検証キーワード、もしくは、入力に不備がある場合はエラーを表示する。

record_controller.rb

```rb
# 検索フォームを表示する
  def keywd
    @search = SearchKeyword.new
  end

  # 検索ボタンがクリックされた場合に呼び出される
  def keywd_process
    @search = SearchKeyword.new(params.require(:search_keyword).permit(:keyword))

    if @search.valid?
      render plain: @search.keyword
    else
      render plain: @search.errors.full_messages[0]
    end
  end
```

keywrd.html.erb

```rb
<%= form_for @search, url: { action: :keywd_process } do |f| %>
  <%= f.text_field :keyword, size: 25 %>
  <%= f.submit '検索' %>
<% end %>
```

![スクリーンショット 2020-11-21 12.08.10.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/4be41f27-c94f-8c64-3343-17990a8bc74d.png)

## アソシエーションによる複数テーブル処理

アソシエーション(関連) とは、テーブル間のリレーションシップをモデル上の関係として操作できるようにするしくみ。

アソシエーションを利用することで、複数テーブルにまたがるデータ操作をより直感的に利用できるようになる。

### リレーションシップと命名規則

![スクリーンショット 2020-11-21 12.19.02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/1c0fe3d5-c5d6-5d90-fcb0-f989469d2296.png)

以下の命名規則に注意。

- 外部キー列は「参照先モデル名\_id」の形式(例: book_id, user_id)
- 中間テーブルは参照先のテーブル名で「\_」で連結したものであること。ただし連結順序は辞書順(authors_books)

中間テーブルとは m:n の関係を表現する際に、互いの関連付けを管理するための便宜的なテーブル。

結合テーブルと呼ぶ場合もある。

### 参照元テーブルから参照先テーブルの情報にアクセスする belong_to アソシエーション

![スクリーンショット 2020-11-23 10.47.21.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/47b971e4-39c7-88f2-032d-cbe11ae9b505.png)

```rb
class Review < ApplicationRecord
  belongs_to :book
end
```

上記のようにすることで、

```rb
Review.find(1).book.title
```

のように、id のレビューに紐づく親の book タイトルを参照することができる

```sql
Review Load (0.3ms)  SELECT  `reviews`.* FROM `reviews` WHERE `reviews`.`id` = 1 ORDER BY `reviews`.`updated_at` DESC LIMIT 1
Book Load (0.4ms)  SELECT  `books`.* FROM `books` WHERE `books`.`id` = 1 LIMIT 1
```

### 1:n の関係を表現する has_many アソシエーション

![スクリーンショット 2020-11-23 10.56.31.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/5909b131-6280-ffc4-63bb-552b88a04379.png)

```rb
class Book < ApplicationRecord
  has_many :review
end
```

上記のようにすることで

```rb
Book.find(1).reviews
```

id が 1 の book に紐づいている全ての review を呼び出せる。

```sql
 Book Load (0.3ms)  SELECT  `books`.* FROM `books` WHERE `books`.`id` = 1 LIMIT 1
 Review Load (1.4ms)  SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 1 ORDER BY `reviews`.`updated_at` DESC
```

### 1:1 の関係を表現する has_one アソシエーション

1:1 の関係とは、今回では users テーブルと authors テーブルのような関係をいう。

users/authors テーブルでは、あるユーザーが著者としても登録されているようなモデルを想定している。

1 人のユーザが複数の著者になることはない。

![スクリーンショット 2020-11-23 11.06.46.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/0e57464c-4390-7e05-12cd-a0981bd66664.png)

```rb
class User < ApplicationRecord
  has_one :author
end
```

```rb
class Author < ApplicationRecord
  belongs_to :user
end
```

has_one メソッドは 1 つの User オブジェクトにたいして最大 1 つの Autho オブジェクトが存在する。という意味となる。

これによって

```rb
User.find(1).author
```

id が 1 の user に紐づく著者を呼び出すことができる

```SQL
User Load (0.8ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1
Author Load (0.6ms)  SELECT  `authors`.* FROM `authors` WHERE `authors`.`user_id` = 1 LIMIT 1
=> #<Author:0x0000561e50372598
 id: 1,
 user_id: 1,
 name: "山田祥寛",
 birth: Thu, 04 Dec 1975,
 address: "千葉県鎌ケ谷市宝町1-1-1",
 ctype: nil,
 photo: nil,
 created_at: Sun, 11 Oct 2020 13:46:12 UTC +00:00,
 updated_at: Sun, 11 Oct 2020 13:46:12 UTC +00:00>
```

### m:n の関係を表現する has_and_belogs_to_many アソシエーション

m:n(多:多)の関係とは、今回では books/authors のような関係。

書籍情報には複数の著者が含まれる可能性があり、著者もまた複数の書籍を執筆している可能性がある。

リレーショナルデータベースではこのような関係を直接表現することができないので、author_books という形式的な中間テーブルを使って表現する 。

![スクリーンショット 2020-11-23 11.25.42.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/4a8e6b90-d195-122c-ed0d-ec2e539b0986.png)

```rb
class Book < ApplicationRecord
  has_and_belongs_to_many :authors
end

```

```rb
class Author < ApplicationRecord
  has_and_belongs_to_many :books
end
```

m:n の関係ではどちらが主従とうことはないので、双方に対して has_and_belongs_to_many メソッドによる宣言をする。

- record_controller.rb

```rb
def has_and_belongs
  @book = Book.find(1)
end
```

```rb
<h2>「<%= @book.title %>」の著者情報</h2>
<hr />
<ul>
<% @book.authors.each do |author| %>
  <li><%= author.name %>（<%= author.birth %>｜<%= author.address %>）</li>
<% end %>
</ul>
```

![スクリーンショット 2020-11-23 11.37.17.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a6277a0f-d5f3-9268-4203-85b011e0bfc9.png)
)

### m:n の関係を表現する(2) has_many through アソシエーション

has_and_belogs_to_many アソシエーションは m:n の関係を表現するには手軽は方法だが、デメリットがある。

それは中間テーブルを便宜的なものとして操作するため、中間テーブルに関連付け以上の情報を加えることができない。

つまり、中間テーブルを介した情報をえることができない。

以下のような関連付けをしたいばあいは、has_many through アソシエーションを使用する。

![スクリーンショット 2020-11-23 11.46.48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/b5263130-2544-593b-b4f2-7ceaef806778.png)

```rb
class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
end
```

```rb
class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
```

```rb
class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviwes
end
```

こうすることで以下のようなアクセスをすることができる

```rb
User.find(2).books
```

```sql
User.find(2).books
  User Load (0.3ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 2 LIMIT 1
  Book Load (0.4ms)  SELECT `books`.* FROM `books` INNER JOIN `reviews` ON `books`.`id` = `reviews`.`book_id` WHERE `reviews`.`user_id` = 2 ORDER BY `reviews`.`updated_at` DESC
```

### アソシエーションによって追加されるメソッド

belogs_to/has_one で追加されるメソッド

| メソッド                           | 概要                                 | 例                                                        |
| ---------------------------------- | ------------------------------------ | --------------------------------------------------------- |
| assosication(force_reload = false) | 関連するモデルを取得。               | @book = @review.book                                      |
| assosication(associate)            | 関連先モデルを割当                   | @review.book = @book                                      |
| build_assosication(attrs = {})     | 関連先モデルを新規作成(保存はしない) | @author = @user.build_author(name: 'hoge',birth: 'huga')  |
| create_assosication(attrs = {})    | 関連先モデルを新規作成(保存する)     | @author = @user.create_author(name: 'hoge',birth: 'huga') |

- has_many/has_and_belongs_to_many で追加されるメソッド

| メソッド                          | 概要                                               | 例                                   |
| --------------------------------- | -------------------------------------------------- | ------------------------------------ |
| colliection(force_reload = false) | 関連するモデルを取得。                             | @reviews = @book.reviews             |
| colliection << (obj)              | 関連するモデルを追加                               | @book.reviews << @review             |
| colliection.destroy(obj)          | 関連するモデルを削除                               | @book.reviews.destory(@review)       |
| colliection.delete(obj)           | 関連するモデルを削除                               | @book.reviews.delete(@review)        |
| colliection = objs                | 現在のモデルに関するモデルを指定モデル郡で入れ替え | @book.reviews = @new_reviews         |
| colliection_singular_ids          | 関連モデルの id 値を配列として取得                 | @review_ids = @book.review_ids       |
| colliection_singular_ids          | 関連モデルの id 値を配列として取得                 | @review_ids = @book.review_ids       |
| colliection_singular_ids = ids    | 関連モデルの id 値を総入れ替え                     | @book.review_ids = @review_ids       |
| colliection.clear                 | 関連モデルを破棄                                   | @book.reviews.clear                  |
| colliection.empty?                | 関連モデルが存在するかチェック                     | @book.reviews.empty?                 |
| colliection.empty?                | 関連モデルが存在するかチェック                     | @book.reviews.empty?                 |
| colliection.size?                 | 関連モデルの数の取得                               | @book.reviews.size                   |
| colliection.find(..)              | 関連モデル郡から特定のモデルを抽出                 | @book.reviews.find(1)                |
| colliection.exist?(..)            | 関連モデル郡から特定のモデルが存在するかチェック   | @book.reviews.exists?(1)             |
| colliection.build(attrs = {})     | 関連先のモデルを新規作成(保存しない)               | @book.reviews.build(body: '良い本')  |
| colliection.create(attrs = {})    | 関連先のモデルを新規作成(保存する)                 | @book.reviews.create(body: '良い本') |

### アソシエーションで利用できるオプション

基本的なテーブルでデフォルトの命名規則に沿っている場合には、特別なオプションの指定をほとんど必要ない。

しかし、独自の命名を行なっている場合や、あるいはカウンターキャッシュやポリモーフィック関連のような追加機能を利用したいケースもある。

そのような場合に使用できる Rails のオプションを指定することで、様々なカスタマイズか可能になる。

- アソシエーションで利用できる主なオプション(bl: belongs_to, ho: has_one, hm: has_many hbtm: has_and_belongs_to_many)

| オプション              | bl  | ho  | hm  | hbtm | 概要                                                                      |
| ----------------------- | --- | --- | --- | ---- | ------------------------------------------------------------------------- |
| as                      | x   | o   | o   | x    | ポリモーフィック関連を有効化(親モデルの関連名)                            |
| association_foreign_key | x   | x   | x   | o    | m:n 関係で関連先への外部キー(たとえば Book モデルから見た author_id など) |
| autosave                | o   | o   | o   | o    | 親モデルに併せて保存/削除を行う                                           |
| class_name              | o   | o   | o   | o    | 関連モデルのクラス名                                                      |
| counter_cache           | o   | x   | o   | x    | モデル数を取得する際にキャッシュを利用するか                              |
| dependent               | o   | o   | o   | x    | モデル削除時に関連先のモデルも削除するか(:destroy,:delete,;nullify)       |
| foreign_key             | o   | o   | o   | o    | 関連で使用する外部キー列の名前                                            |
| join_table              | x   | x   | x   | o    | 中間テーブルの名前                                                        |
| optional                | o   | x   | x   | x    | 関連先のオブジェクトが存在するかを検証しない                              |
| primary_key             | o   | x   | o   | x    | 関連で使用する主キー列の名前                                              |
| polymorphic             | o   | x   | x   | x    | ポリモーフィック関連を有効化                                              |
| readonly                | x   | x   | x   | o    | 関連先のオプジェクトを読取専用にするか                                    |
| required                | o   | x   | x   | x    | 関連先のオブジェクトが存在するかを検証                                    |
| touch                   | o   | x   | x   | x    | モデル保存時に関連先オプジェクトの created_at/updated_at も更新           |
| through                 | x   | o   | o   | x    | 関連先のオブジェクトを参照する                                            |
| validate                | o   | o   | o   | o    | 現在のモデルを保存する際に、関連先の検証も実行するか                      |

#### 関連の命名を変更する

Aouthor モデルに対して、1:n の関係にある FanComment モデル(ファンコメント)を追加する例

![スクリーンショット 2020-11-23 17.14.50.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/360bf52a-ada4-3d6f-7dfa-0af3cd1f6dcd.png)

- Aouthor モデルからは FanComment モデル(fan_comments メソッドではなく)comments メソッドで参照

- faon_comments テーブルの外部キーは aouthor_no フィールド

- Author モデルから FanComment モデルを取得する際に、deleted 列が false(未削除)であるもののみを抽出したい

以上の要件を満たすためには、Author モデルで has_many 関連を定義する際に、以下のようなオプションを設定する必要がある。

- author.rb

```rb
class Author < ApplicationRecord
  has_many :comments, -> { where(deleted: false) }, class_name: 'FanComment',
    foreign_key: 'author_no'
end
```

まず:comments と定義しているが、用途によって自由に付けて良い。

ちなみに commets メソッドで関連先のテーブルを参照することができるようになる。

ただし、デフォルトでは関連名がそのまま関連先のクラス名とみなされるため、自由に命名した場合には、class_name オプションで関連先のクラス名を宣言する必要がある。

foreign_key:は外部キーを指定している。

通常は「author_id」のように「モデル名 + \_id」の形式となるはずだが、異なる命名をしている場合には、foreign_key オプションで明示的に宣言する必要がある。

また-> { where(deleted: false) }で FanComment モデルを参照する際の条件式を指定している。

条件式はメソッドの第二引数にラムダ式 -> { where(deleted: false) } の形式で表す。

この例では、削除済みのコメントは参照したくないので、deleted 列が false のもののみ限定して取得している。

ラムダ式の中では、where メソッドだけでなく order/limit などのクエリメソッドを指定できる。

#### 関連モデルの件数を親モデル側でキャッシュする counter_chache オプション

例えばあるユーザー(users テーブル)が投稿したレビュー(reviews テーブル)の件数を users テーブルで保存しておければ、件数を取得する為だけに両者を結合する必要がなくなり便利。

アソシエーションでは、belongs_to メソッドの counte_cache オプションを利用することで、このような仕組みを簡単に実装できる。

![スクリーンショット 2020-11-23 17.35.23.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/a842cd1a-2fb4-b4c8-873f-1db1a99dd528.png)

1. カウンター管理のための列を作成する
   まず、親テーブルに「小テーブル名\_count」という名前で integer 型の列(カウンター列)を準備する。
   Active Record では、このカウンター列に対して関連モデルの件数を記録することで。カウンターキャッシュを実現している。
   この例であれば、users テーブルの reviews_count 列が、関連するレビュー数を管理する。
   rails generete コマンドで自動生成したマイグレーションファイルは、そのまま利用できるが、最低限 default: 0 を追記する必要がある。
   これでカウンター列のデフォルトを 0 に設定できる

1. カウンターキャッシュ機能を有効にする
   あとは子モデル(Review モデル)でカウンターキャッシュを有効にする

   ```rb
   class Review < ApplicationRecord
      belongs_to :book
      # カウンターキャッシュを有効化
      belongs_to :user, counter_cache: true
   end
   ```

   ただし、カンター列が「review_count」のように「小テーブル\_count」でない場合は「counter_cache: :review_num」のように、明示的に列名を指定しなければならない。

1. カウンターキャッシュを利用して件数を取得する

   - record_controller.rb

   ```rb
   def cache_counter
    @user =User.find(1)
    render plain: @user.reviews.size
   end
   ```

   ```sql
   User Load (0.5ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1
   ```

   「@user.reviews.size」で Review モデルへのアクセスが発生しているにもかかわらず、reviews テーブルへの問い合わせは発生していない点が注目。

   size メソッドと似たようなメソッドで、length/count などがあるが、これらのメソッドではカウンターキャッシュは働かないので注意。

##### カウンターキャッシュの仕組み

カウンターキャッシュを有効にした状態で、子モデルを追加/削除すると親モデルのカウンター列が自動的にインクリメント/デクリメントされる。

以下では、新規にレビューを登録した場合に発生する SQL

```sql
INSERT INTO `reviews` (`book_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES (1, 1, '良い', '2020-11-23 09:14:11', '2020-11-23 09:14:11')
User Update All (2.6ms)  UPDATE `users` SET `reviews_count` = COALESCE(`reviews_count`, 0) + 1 WHERE `users`.`id` = 1
```

モデルを介さずにデーターベスを更新した場合、もしくはコールバックを利用しないメソッド(たとえば delete メソッドのように)でモデルを操作した場合にはカウンターは正しく管理できない。

同じ理由からテーブルのデータを初期化する場合にはその時点での子モデルの件数を反映しなければならない。

自動的に、その時点での件数が反映されるわけではないので、要注意。

#### 1 つのモデルを複数の親モデルに関連付ける ポリモーフィック関連

ポリモーフィック関連とは 1 つのモデルが複数の親モデルに紐づく関連のこと。

具体的には以下のような関連。

![スクリーンショット 2020-11-23 18.19.26.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/c4092459-1c79-eaf2-3e9f-71e8b91dcbb5.png)

この例では Book(書籍)/Author(著者)モデルは、それぞれのメモ情報を Memo(メモ)モデルで管理している。

このようなポリモーフィック関連では、通常の外部キーだけでは紐付けを表現できないので、

- xxxx_type(紐づけるモデル)

- xxxx_id(外部キー)

のような列をテーブルに準備しておく必要がある。

xxxx はあとから指定する関連名を表す。

そして、モデル側では以下のような宣言が必要

- 親モデル側で as オプション付きの has_many メソッドを宣言

- 子モデル側で polymorphic オプション付きの bolengs_to メソッドを宣言

- book.rb

```rb
class Book < ApplicationRecord
  has_many :memos, as: :memoable
end
```

- author.rb

```rb
class Author < ApplicationRecord
  has_many :memos, as: :memoable
end
```

- memo.rb

```rb
class Memo < ApplicationRecord
  belongs_to :memoable, polymorphic: true
end
```

as オプションには関連名を指定する。

この例では親モデル(Book/Aouthor)が子モデル(Memo)から memorable という名前で参照できるようにポリモーフィック宣言している。

- as オプションの値

- belongs_to メソッドの引数

- 子テーブル側の xxx_type/xxx_id 列の xxx の部分

は全て同じでなくてはならない。

- record_controller.rb

```rb
def memorize
  @book = Book.find(1)
  @memo = @book.memos.build({ body: 'あとで買う' })
  if @memo.save
    render plain: 'メモを作成しました。'
  else
    render plain: @memo.errors.full_messages[0]
  end
end
```

build メソッドで書籍情報に関連付いたメモ情報を生成している。

上のアクションを実行いした後、rails dbconsole コマンドなどで memos テーブルの内容を確認する。

以下のように memoable_type 列に関連先モデルである Book が、memoable_id 列に books テーブルの id 値がセットされていればポリモーフィック関連が正しく動作している。

```sql
Select * FROM memos;
+----+---------------+-------------+-----------------+---------------------+---------------------+
| id | memoable_type | memoable_id | body            | created_at          | updated_at          |
+----+---------------+-------------+-----------------+---------------------+---------------------+
|  1 | Book          |           1 | あとで買う      | 2020-11-23 15:16:56 | 2020-11-23 15:16:56 |
+----+---------------+-------------+-----------------+---------------------+---------------------+
1 row in set (0.001 sec)
```

### 関連するモデルと結合する joins メソッド

複数のテーブルと結合する場合、Rails ではアソシエーションを利用するのが基本だが、joins メソッドを利用する方法でもほぼ同様のことができる。

joins メソッドは、関連するモデルを結合し、まとめて取得するメソッド。

引数は以下をしようする。

#### 関連名(シンボル)

指定した関連名で INNEW JOIN 句を生成する。

カンマ区切りで複数のシンボルを同時に指定しても構わない。

- record_controller.rb

```rb
def assoc_join
  @books = Book.joins(:reviews, :authors).
    order('books.title, reviews.updated_at').
    select('books.*, reviews.body, authors.name')
end
```

```sql
 SELECT books.*, reviews.body, authors.name FROM `books` INNER JOIN `reviews` ON `reviews`.`book_id` = `books`.`id` INNER JOIN `authors_books` ON `authors_books`.`book_id` = `books`.`id` INNER JOIN `authors` ON `authors`.`id` = `authors_books`.`author_id` ORDER BY books.title, reviews.updated_at
```

#### 関連名 1: 関連名 2

複数モデルにまたがる結合を表す。

- record_controller.rb

```rb
def assoc_join2
@books = Book.joins(reviews: :user).
    select('books.*, reviews.body, users.username')
end
```

```sql
SELECT books.*, reviews.body, users.username FROM `books` INNER JOIN `reviews` ON `reviews`.`book_id` = `books`.`id` INNER JOIN `users` ON `users`.`id` = `reviews`.`user_id`
```

#### 文字列

LEFT JOIN/RIGHT JOIN など、INNER JOIN 以外の結合条件を表すのに利用している

- record_controller.rb

```rb
def assoc_join3
  @books = Book.joins('LEFT OUTER JOIN reviews ON reviews.book_id = books.id').
    select('books.*, reviews.body')
end
```

```sql
 SELECT books.*, reviews.body FROM `books` LEFT OUTER JOIN reviews ON reviews.book_id = books.id
```

いずれの場合も、JOIN 句によって複数のテーブルの内容を単一の問い合わせで取得している点に注目

また、joins メソッドを利用した場合、関連モデルの列には現在のモデルからアクセスする。

body 列は reviews テーブルに、name 列には authors テーブルに属する列である点に注目

- record/assoc_join.html.erb

```rb
<% @books.each do |b| %>
  <p><%= b.body %>（<%= b.title %>：<%= b.name %>）</p>
<% end %>
```

### 関連するモデルと結合する left_outer_joins メソッド

- record_controller.rb

```rb
 def assoc_join4
    @books = Book.left_outer_joins(:reviews).select('books.*, reviews.body')
    render 'assoc_join3'
  end
```

```sql
 SELECT books.*, reviews.body FROM `books` LEFT OUTER JOIN `reviews` ON `reviews`.`book_id` = `books`.`id`
```

### 関連するモデルをまとめて取得する includes メソッド

アソシエーションで関連モデルを読み込むのは、それが必要になったタイミングである。

つまり複数モデルを each メソッドなどで処理し、それぞれの関連モデルを取得するさいには、元モデルの数だけデータアクセスが発生するということ。

これは効率という意味でも望ましくない為、このような状況では includes メソッドを利用する。

includes メソッドでは指定された関連モデルを元モデルの読み込み時にまとめて取得することで、データアクセス回数を減らす。

- record_controller.rb

```rb
def assoc_includes
  @books = Book.includes(:reviews).all
  # @books = Book.all
end
```

```sql
SELECT `books`.* FROM `books`
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) ORDER BY `reviews`.`updated_at` DESC
```

includes メソッドの引数には関連モデルを指定する

includes メソッドを外した場合、以下のように reviews テーブルへのアクセスが何度も発生する。

```sql
 Book Load (0.5ms)  SELECT `books`.* FROM `books`
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 1 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 2 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 3 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 4 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 5 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 6 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 7 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 8 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 9 ORDER BY `reviews`.`updated_at` DESC
SELECT `reviews`.* FROM `reviews` WHERE `reviews`.`book_id` = 10 ORDER BY `reviews`.`updated_at` DESC
```

## コールバック

コールバックは Active Record による検索/登録/更新/削除、および、検証処理のタイミングで実行されるメソッド。

- ユーザー情報を登録する際にパスワードが指定されていなかったら、ランダムのパスワードを生成

- 書籍情報を削除するさいに、削除される書籍情報を履歴情報として記録する

- 著者情報を削除するさいに、ファイルシステムで管理していたサムネイル画像も削除

- 著者情報が登録/更新されたタイミングで、管理者にメールを送信

など、モデル操作のタイミングでまとめて実行すべき処理はコールバックとして定義することで、同じようなコードがモデルやコントローラに分散するのを防げる。

また Active Record は、実際の保存処理とコールバックとを、1 つのトランザクションとして実行する。

コールバックを利用することで、関連する一覧の処理を、トランザクションを意識することなく記述できるというメリットもある。

### 利用可能なコールバックと実行タイミング

新規登録/更新/削除タイミングで呼び出されるコールバックには、以下のようなものがある。

ちなみに以下の表はコールバックの発生順序に沿っている。

| 登録              | 更新          | 削除           | 実行タイミング       |
| ----------------- | ------------- | -------------- | -------------------- |
| berofe_validation | 同様          | -              | 検証処理の直前       |
| after_validation  | 同様          | -              | 検証処理の直後       |
| before_save       | 同様          | -              | 保存の直前           |
| around_save       | 同様          | -              | 保存の前後           |
| before_create     | before_update | before_destroy | 作成/更新/削除の直前 |
| around_create     | around_update | around_destroy | 作成/更新/削除の前後 |
| after_create      | after_update  | after_destroy  | 作成/更新/削除の直後 |
| after_save        | 同様          | -              | 保存の直後           |
| after_commit      | 同様          | 同様           | コミットの直後       |
| after_rollback    | 同様          | 同様           | ロールバックの直後   |

その他、データの取得、オブジェクトの生成タイミングで呼び出されるコールバックもある

| コールバック     | 実行タイミング                         |
| ---------------- | -------------------------------------- |
| after_find       | データベースの検索時                   |
| after_initialize | new による生成、データベースからロード |

after_find/after_initilize メソッドには対応する、before_xxxx メソッドがない点に注意。

これらのコールバックメソッドはメソッドが呼び出されたタイミングで実行される。

逆にいえば、たとえば delete や delete_all のようなメソッドでは、コールバックは呼び出されずすぐにデータの削除が行われる。

| 分類             | トリガーとなるメソッド                                                                                                      |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------- |
| 作成/更新/削除系 | create,create!,decrement!,destroy,destroy!,destroy_all,increment!,save,save!,toggle!,update,update!,update_attribute,valid? |
| after_find       | all,first,find,find_by,find_by_sql,last                                                                                     |
| after_imitialize | new、その他オブジェクト生成を伴うメソッド                                                                                   |

### コールバック実装の基礎

- book.rb

```rb
class Book < ApplicationRecord
  #コールバックメソッド
  after_destroy :history_book

  private
    def history_book
      logger.info('deleted: ' + self.inspect)
    end
end
```

#### 条件付きでコールバックを適用する

特定の条件を満たした場合にのみコールバックを作動させたい場合には、if/unless パラメータを指定する。

たとえば、以下は publish 列が unknown でない場合のみ history_book コールバックを実行する例

- book.rb

```rb
class Book < ApplicationRecord
# 条件付きでコールバックを適用
 after_destroy :history_book,
 unless: Proc.new { |b| b.publish == "unknown" }
 end
```

### コールバックのさまざまな定義方法

コールバックメソッドはプライベートメソッドとして定義するのが基本。

しかし状況によって以下のような構文で定義した方が良い場合もある。

#### ブロック形式で定義する

after_destroy メソッドにたいして、コールバック処理を直接ブロックとして指定することもできる。

ブロックの内容がシンプルである場合は、有効な記法。

- book.rb

```rb
class Book < ApplicationRecord
# コールバックメソッドをブロック形式で定義
  after_destroy do |b|
    logger.info('deleted: ' + b.inspect)
  end
end
```

#### コールバッククラスとして定義する

コールバックを複数のモデルで共有するようなケースでは、コールバックメソッドを別のクラス(コールバッククラス)として外部化した方が再利用性という点で有利。

- book_callbacks.rb

```rb
class BookCallbacks
  cattr_accessor :logger
  self.logger ||= Rails.logger

  def after_destroy(b)
    logger.info('deleted: ' + b.inspect)
  end
end
```

- book.rb

```rb
class Book < ApplicationRecord
  after_destroy BookCallbacks.new
end
```

コールバックメソッドそのものの記述はこれまでと同様。

ただし一点注意することは、コールバッククラスは普通の Ruby クラスなので、そのままでは logger オブジェクトを呼び出せないという点。

そこで cattr_accessor メソッドでクラス変数 logger を定義した上で、logger に Rails.logger プロパティ経由でアプリデフォルトのロガーをセットしている。

普通の Ruby クラスからでも logger オブジェクトにアクセスできるようになる。

コールバックをクラスとして定義した場合、Book モデル側では BookCallbacks.new のインスタンを渡すようにする。

# マイグレーション

Rails では、テーブルレイアウトを作成/変更するためのというしくみとしてマイグレーションという機能を提供している。

単にテーブルを準備するためのしくみとして紹介したが、Migration(移行)という名前のとおり、マイグレーション機能は開発途中でのスキーマの変化に際して真価を発揮する。

今回はマイグレーションの仕組みと、さまざまなスキーマ管理の方法について学ぶ。

## マイグレーションのしくみ

まずはマイグレーションの仕組みについて全体像の確認。

![スクリーンショット 2020-11-28 16.40.48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/4c75c0a3-6032-7b07-d069-465b40948fd4.png)

データベースのスキーマ変更の役割を担うのがマイグレーションファイル。

rails generate コマンドで生成できる。

マイグレーションファイルの名前には生成時のタイムスタンプ値(20201013062804 など)が含まれており、Rails はこの値を使って、そのスクリプトが実行済みであるかどうかを管理する。

具体的には、データベースの shcema_migration テーブルに注目してみる。

マイグレーション機能を利用した場合、chema_migrations テーブルに実行済みマイグレーションファイルのタイムスタンプが記録される。

Rails(rails コマンド)では、schem_migrations テーブルと db/migration フォルダー配下のマイグレーションファイルとを比較し、未実行のマイグレーションを自動的に認識し、実行する。

また、マイグレーション機能では特定のタイミングまでスキーマの状態を戻したり、あるいは、指定されたバージョンだけスキーマをロールバックしたり、といったこともできる。

スキーマの変動が激しい、(場合によっては過去の状態を復元させたい)ような開発の局面ではマイグレーションんは欠かすことのできない機能。

## マイグレーションファイルの構造

- db/migrate/20200623135202_create_books.rb

```rb
class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.integer :price
      t.string :publish
      t.date :published
      t.boolean :dl

      t.timestamps
    end
  end
end
```

マイグレーションファイルでは、まず change メソッドでスキーマ操作の実処理を表すのが基本。

利用できるメソッドにはテーブルの作成/削除をはじめ、インデックスの設置/破棄、フィールドの追加/変更/削除などのメソッドがあるが、まずはもっとも使う create_table メソッドについて理解する。

#### マイグレーションバージョン

Rails4 以前から rails に触れていた人は、マイグレーションファイルの先頭にある「ActiveRecord::Migreation[5.0]」という記述が気になったかもしれない。

Rails5 ではこのようにマイグレーションファイルが「どのバーションの Rails で作成されたか」を表す情報が付与されるようになった。

これによって Rails のバージョンによってマイグレーションの挙動が変わった場合にも、それぞれのバージョンに応じた操作が可能になる。

たとえば Rails5.0 では timestamps メソッドで NOT NULL 制約が付与されるようになった。

そのような挙動の変化が ¥[5.0]という記述の有無によって制御できるようになった。

![スクリーンショット 2020-11-28 17.01.27.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/cca2d4dd-0890-31f5-58d6-6091df7bfdcf.png)

### 引数 toption テーブルオプション

引数 toption はテーブル全体に関わる、またはその他、SQL の CREATETABLE 命令に付与すべきオプション情報を指定する。

具体的には以下のようなオプションがある

| オプション  | 概要                                                                 | デフォルト値 |
| ----------- | -------------------------------------------------------------------- | ------------ |
| id          | 主キー列 id を自動生成するか                                         | true         |
| primary_key | 主キー列の名前(id オプションが true の場合のみ)                      | id           |
| temporary   | 一時テーブルとして作成するか                                         | false        |
| force       | テーブルを作成する前にいったん既存テーブルを削除するか               | false        |
| options     | その他のテーブルオプション(例:options: 'ENGINE=innoDB CHAREST=utf8') | true         |

Rails ではデフォルトで主キー列 id が自動生成される。

特別な理由が無い限り、できるだけけこのルールを変更するべきではない。

もしもデータベース側で id 以外の主キーを設置した場合には、対応するモデル側でも以下のように主キー名を宣言する必要がある。

```rb
class Book < ApplicationRecord
  set_primary_key 'book_no'
end
```

#### SELECT した結果をもとにテーブルを作成する

ちょっと変わり種のオプションとして、create_table には as オプションもある。

as オプションを利用することで、テーブル作成するさいに(ブロックで個々のフィールドを指定する代わりに)サブクエリを指定できるようになる。

books/reviews テーブルを結合した結果をもとに、テーブル current_reviews を生成するサンプル

- db/migrate/202006xxxxxxx_create_current_reviews.rb

```rb
create_table :current_reviews, as: 'SELECT books.*, reviews.body FROM books INNER JOIN reviews ON books.id = reviews.book_id'
```

```
$ docker-compose run web rails g migration current_reviews
$ docker-compose run web rails db:migrate
```

上記はただテーブルを as オプションを使って sql で定義できるだけで、とくに今後新しいレビューをつくると勝手に create_review テーブルにレコードが入っていくわけではない。

### フィールド定義は t.データ型

テーブルに属するフィールドは、create_talbe メソッド配下の t.データ型メソッドできる。

利用できるデータ型と、SQLlite データベース、Ruby のデータ型との対応関係は以下の通り。

| マイグレーション | SQLlite      | Ruby                 |
| ---------------- | ------------ | -------------------- |
| integer          | INTEGER      | Fixnum               |
| decimal          | DECIMAL      | BigDecimal           |
| float            | FLOAT        | Float                |
| string           | VARCHAR(225) | String               |
| text             | TEXT         | String               |
| binary           | BLOB         | String               |
| date             | DATE         | Date                 |
| datetime         | DATETIME     | Time                 |
| timestamp        | DATETIME     | Time                 |
| time             | TIME         | Time                 |
| boolean          | BOOLEAN      | TrueClass/FalseClass |

その他、特殊な列を定義するためのメソッドとして timestamps や references もある。

timestamps メソッドは、日付時刻型の created_at/updated_at 列を生成する。

これから Rails で決められた特別な列で、それぞれのレコードの作成/更新時に作成日時や更新日時を自動設定する。

データの絞り込みなどにも役立つので、無条件に設定しておくのがのぞましい。

references メソッドは外部キー列を生成する。

たとえば「t.references:book」とした場合に、books テーブルの外部キー列とした場合には、books テーブルへの外部キー列として book_id 列を生成する。

[t.reference や外部キー制約についての参考](https://qiita.com/ryouzi/items/2682e7e8a86fd2b1ae47)

### 列制約も定義できる

「t.データ型」メソッドには「制約名:値」の形式で列制約も定義できる。

| 制約名      | 概要                                            |
| ----------- | ----------------------------------------------- |
| limit       | 列の桁数                                        |
| default     | デフォルト値                                    |
| null        | null を許可するか(デフォルトは true)            |
| precision   | 数値の全体行(decimal 型)。123.45 であれば 5     |
| scale       | 小数点以下の桁数(decimal 型)。123.45 であれば 2 |
| polymorphic | belong_to アソシエーションで利用する列名        |
| index       | インデックスを追加するか                        |
| comment     | 列の説明(備考)                                  |

たとえば books テーブルに上記制約を付与している。

- books テーブルの制約

| フィルド名 | データ型     | 制約                       |
| ---------- | ------------ | -------------------------- |
| isbn       | VARCHAR(17)  | NOT NULL                   |
| title      | VARCHAR(100) | NOT NULL                   |
| price      | DECIMAL      | 全体 5 桁(小数点以下 0 桁) |
| publish    | VARCHAR(20)  | 技術評論社(デフォルト値)   |

### データベースの値を暗黙的に型変換する

Rails5.0 で追加された ActiveRecord attributesAPI を利用することで、マイグレーションで定義された型(データベースに格納する型)を、モデル側で上書きすることが可能になる。

たとえば books テーブルの price フィールドは integer 型。

しかし、なんらかの都合でアプリ側では float 型として扱いたいという状況があった場合、モデルクラスに attribute メソッドで以下のように宣言する。

- book.rb

```rb
class Book < ApplicationRecord
  attribute :price, :float
end
```

attribute メソッドの構文は以下のとおり。

- attribute メソッド

```
attribute(name, type[,default: value])
--------------------------------------
name:プロパティ名 type:データ型 value:デフォルト値
```

ここでは利用してないが default オプションで、値を得られなかった場合のデフォルト値を指定できる。

- record_controller.rb

```rb
def attr
  @book = Book.find(1)
  render plain: @book.price.class
end
```

price プロパティの型を確認すると、「Float」という結果が得られる。

## マイグレーションファイルの作成

マイグレーションファイルを作成する方法は以下の 2 種類に大別できる。

1. rails generate model コマンドでモデルと併せて作成する

1. rails generate migration コマンドを使ってマイグレーションファイル単体で作成する

新規にテーブルを作成する場合には、1.でモデルもろとも作成するのが手軽。

既に存在するテーブルに対して、レイアウトの修正を行いたい場合は 2 の方法を利用する。

1 については既に解説済み。

2 の方法は以下

```
$ rails generate migration name [filed :type...][otpions]
---------------------------------------------------------
name: 名前 field: フィールド名 type: データ型 options: 動作オプション
```

名前とはマイグレーションファイルのクラス名。

自由に命名できるが、全てのマイグレーションファイルの中で一意である必要がある。

また処理内容を識別しやすくするという意味でも、できるだけ具体的な名前を指定することをおすすめする。

そもそもフィールドの追加/削除を行う場合には

- AddXxxxTo テーブル名
- RemoveXxxxFrom テーブル名

の形式に則った名前を指定すれば、マイグレーションファイルの骨組みだけでなく、具体的な追加/削除のコードも自動生成する。

たとえば、以下は author テーブルに日付型の birth 列を追加する場合のコマンド

```
$ rails g migration AddBirthToAuthors birth:date
```

これにより以下のようなコードができる。

- db/migrate/202006xxxxxxx_add_birth_to_author.rb

```rb
class AddBirthToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :birth, :date
  end
end
```

果たして、change メソッドには列を追加するためのコードが自動生成されていることが確認できる。

もちろん、自動生成されたコードはあくまで骨組みにすぎないので、必要に応じて、さまざまな処理を自分で追加できる。

#### 手作業での作成

マイグレーションファイルは手作業で作成することもできる。

無用なトラブルを引き起こさないためにも、まずは rails g migration コマンドを利用するのをおすすめする。

もしも、一からファイルを作成する場合には以下の点に注意。

1. ファイル名とクラス名は対応関係にあること
1. ActiveRecord::Migration クラスを景勝していること

マイグレーションファイルの名前には、クラス名をアンダースコア形式(すべて小文字で表記し、単語の区切りは「\_」)に変換した上で、先頭にタイムスタンプ値を付与する必要がある。

つまり、クラス名が AddAuthorToBooks であれば、ファイル名は 2020xxxxxxx_add_author_to_books.rb のような名前でなければならない。

特にクラス名をあとから変更したい場合は、ファイル名の変更忘れに注意する必要がある。

## マイグレーションファイルで利用できる主なメソッド

create_table メソッド以外にも、マイグレーションファイルで以下のようなメソッドを利用できる。

- マイグレーションファイルで利用できる主なメソッド

| メソッド                                 | 概要                                                  |
| ---------------------------------------- | ----------------------------------------------------- |
| add_column(tname,fname,type[.opt])       | 新規に列を追加                                        |
| add_index(tname,fname[.i_opt])           | 新規にインデックスを追加                              |
| add_foreign_key(tname,frname[.fr_opt])   | 外部キーを追加                                        |
| add_timestanmps(tname)                   | created_at/updated_at 列を追加                        |
| change_column(tname,fname,type[.opt])    | 既存の列を定義                                        |
| change_column_null(tname,fname,null)     | 引数 null が false の場合、列の NOT NULL 制約を有効化 |
| change_column_default(tname,fname,null)  | 列のデフォルト値を引数 default に変更                 |
| change_table(tname)                      | テーブル定義を変更                                    |
| change_exists?(tname,fname[,type[.opt]]) | 指定列が存在するかを確認                              |
| change_tabel(tname[.t_opt])              | 新規テーブルを追加                                    |
| change_join_tabel(tname1,tname2[.t_opt]) | tname1 と tname2 を紐づける中間テーブルを生成         |
| drop_tabel(tname[.t_opt])                | 既存のテーブルを削除                                  |
| index_exists?(tname,fname[.i_opt])       | インデックスが存在するかを確認                        |
| remove_column(tname,fname[,type,opt])    | 既存の列を削除                                        |
| remove_columns(tname,fname[,...])        | 既存の列を削除(複数列対応)                            |
| remove_index(tname [.i_opt])             | 既存のインデックスを削除                              |
| remove_foreign_key(tname,fname)          | 外部キーを削除                                        |
| remove_timestamps(tname)                 | 既存の created_at/updated_at 列を削除                 |
| remove_column(tname,old,new)             | 既存の列名を old から new に変更                      |
| remove_index(tname,old,new)              | 既存のインデックス名を old から new に変更            |
| remove_talbe(tname,new)                  | 既存のテーブル名を tname から new に変更              |
| execute(sql)                             | 任意の SQL 命令を実行                                 |

ほとんどが直感的に利用できるものばかりだが、いくつかのメソッドに補足する。

### テーブル定義を変更する change_table メソッド

change_table メソッドは、テーブルレイアウトの変更やインデックスの追加/削除をまとめて行いたい場合に便利なメソッド

- chanbe_table メソッド

```rb
change_table tname do |t|
  ...definition...
end
---------------------
tname: テーブル名 definition: 修正のための命令
```

- db/migrate/202006xxxxxx_change_books.rb

```rb
class ChangeBooks < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.string :author # strings型のauthor列を追加
      t.remove :published, :del # published,del列を削除
      t.index :title # title列にインデックスを追加
      t.rename :isbn, :isbn_code # isbn列をisbn_code列にリレーム
    end
  end
end
```

change_tabel メソッドを利用することで、(他の add_column のようなメソッドと異なり)テーブル名を何度も記述せずにすむため、コードをよりスマートに記述できる。

呼び出しのメソッドも、add_index が index に、remove_column が remove に、rename_column が rename にそれぞれ短くなっている。

change_table メソッドで利用可能なメソッドは以下。

|        |                   |                |                   |
| ------ | ----------------- | -------------- | ----------------- |
| index  | change            | change_default | rename            |
| remove | remove_refarences | remove_index   | remove_timestamps |

### インデックスを追加/削除する add_index/remove_index メソッド

インデックスを追加するのは、add_index メソッドの役割。

```
$ add_index(tname, fname[,opt])
-------------------------------
tname: テーブル名 fname: インデックスを付与するフィールド名
opt: インデックスオプション
```

引数 opt には以下のようなオプションを指定できる。

- add_index メソッドの主なオプション

| オプション名 | 概要                                               |
| ------------ | -------------------------------------------------- |
| unique       | 一意性制約を付与するか                             |
| name         | インデックス名                                     |
| lenght       | インデックスに含まれる列の長さ(SQLlite では未対応) |

具体例は以下

```rb
add_index :books, :title # 1
add_index :books, [:publish, :title] # 2
add_index :books, [:publish, :title], unique: true, name: 'idx_pub_title' # 3
add_index :books, [:publish, :title], length: { publish: 10, title: 20} # 4
```

1 はシンプルな例。

books テーブルの title 列にについてインデックスを設置する。

2 は引数 fname を配列にすることで、publish/title 列のような複数フィールドにまたがるマルチカラムインデックスを生成することもできる。

3 は引数 opt を指定した例。

インデックス名はデフォルトで「テーブル名\_フィールド名\_index」のようになるが、自分の名前を指定したい場合には name オプションを使用する。

4 は length オプションを利用して、publish 列の先頭 10 桁、title 列の先頭 20 桁をもとにインデックスを作成している。

length オプションを指定することで、ディスクサイズを節約できるみならず、INSERT 命令を高速化できる。

このように定義したインデックスは remove_index メソッドによって破棄できる。

- remove_index メソッド

```
remove_index(tname[,opt])
tname : テーブル名 opt:インデックスオプション
```

引数 opt には name(インデックス名)、または column(インデックスを構成するフィールド名)を指定できる。

オプション名を省略した場合はフィールド名を指定したものとみなされる。

```rb
remove_index :books, :title
# books_title_indexインデックスを削除
remove_index :books, column: [:publish, :title]
# publish/title列から構成されるインデックスを削除
```

ちなみに index をつけた直後（add_index :books, [:publish, :title]）こうなる。

まず普通に books を全体を select すると以下のように表示される

```sql
MySQL [app_development]> select * from books;
+----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
| id | isbn              | title                                                  | price | publish            | published  | dl   | created_at          | updated_at          |
+----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
|  1 | 978-4-7741-8411-1 | 改訂新版JavaScript本格入門                             |  2980 | 技術評論社         | 2016-09-30 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  2 | 978-4-7980-4803-1 | はじめてのJSP&サーブレット 第2版                       |  2800 | 秀和システム       | 2016-09-27 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  3 | 978-4-7741-8030-4 | Javaポケットリファレンス                               |  2680 | 技術評論社         | 2016-03-18 |    1 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  4 | 978-4-8222-9876-0 | アプリを作ろう！ Visual C++入門                        |  2000 | 日経BP社           | 2016-06-22 |    1 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  5 | 978-4-8222-9644-5 | アプリを作ろう！ Android入門                           |  2000 | 日経BP社           | 2015-08-21 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  6 | 978-4-7981-3547-2 | 独習PHP 第3版                                          |  3200 | 翔泳社             | 2016-04-08 |    1 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  7 | 978-4-7741-7984-1 | Swiftポケットリファレンス                              |  2780 | 技術評論社         | 2016-03-04 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  8 | 978-4-7981-4102-2 | プログラマのためのDocker教科書                         |  3000 | 翔泳社             | 2015-11-19 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
|  9 | 978-4-7741-7568-3 | AngularJSアプリケーションプログラミング                |  3700 | 技術評論社         | 2015-08-19 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
| 10 | 978-4-7981-4402-3 | 独習ASP.NET 第5版                                      |  3800 | 翔泳社             | 2016-01-21 |    0 | 2020-11-28 09:19:56 | 2020-11-28 09:19:56 |
+----+-------------------+--------------------------------------------------------+-------+--------------------+------------+------+---------------------+---------------------+
10 rows in set (0.002 sec)
```

なので、Book.all は id 順に整列する。

```rb
> Book.all
Book Load (1.7ms)  SELECT `books`.* FROM `books`
[#<Book:0x000055f3e645bf48
  id: 1,
  isbn: "978-4-7741-8411-1",
  title: "改訂新版JavaScript本格入門",
  price: 2980,
  publish: "技術評論社",
  published: Fri, 30 Sep 2016,
  dl: false,
  created_at: Sat, 28 Nov 2020 09:19:56 UTC +00:00,
  updated_at: Sat, 28 Nov 2020 09:19:56 UTC +00:00>,
 #<Book:0x000055f3e645aeb8
  id: 2,
  isbn: "978-4-7980-4803-1",
  title: "はじめてのJSP&サーブレット 第2版",
  price: 2800,
  publish: "秀和システム",
  published: Tue, 27 Sep 2016,
  dl: false,
  created_at: Sat, 28 Nov 2020 09:19:56 UTC +00:00,
  updated_at: Sat, 28 Nov 2020 09:19:56 UTC +00:00>,
 #<Book:0x000055f3e645ad78
  id: 3,
       :
       ;
```

ただし、title 列や id,publish 列を限定して select すると文字の昇順となっている。

```sql
select id, title, publish from books;
+----+--------------------------------------------------------+--------------------+
| id | title                                                  | publish            |
+----+--------------------------------------------------------+--------------------+
|  9 | AngularJSアプリケーションプログラミング                | 技術評論社         |
|  3 | Javaポケットリファレンス                               | 技術評論社         |
|  7 | Swiftポケットリファレンス                              | 技術評論社         |
|  1 | 改訂新版JavaScript本格入門                             | 技術評論社         |
|  5 | アプリを作ろう！ Android入門                           | 日経BP社           |
|  4 | アプリを作ろう！ Visual C++入門                        | 日経BP社           |
|  2 | はじめてのJSP&サーブレット 第2版                       | 秀和システム       |
|  8 | プログラマのためのDocker教科書                         | 翔泳社             |
| 10 | 独習ASP.NET 第5版                                      | 翔泳社             |
|  6 | 独習PHP 第3版                                          | 翔泳社             |
+----+--------------------------------------------------------+--------------------+
10 rows in set (0.001 sec)

select id from books;
+----+
| id |
+----+
|  9 |
|  3 |
|  7 |
|  1 |
|  5 |
|  4 |
|  2 |
|  8 |
| 10 |
|  6 |
+----+

select title from books;
+--------------------------------------------------------+
| title                                                  |
+--------------------------------------------------------+
| AngularJSアプリケーションプログラミング                |
| Javaポケットリファレンス                               |
| Swiftポケットリファレンス                              |
| 改訂新版JavaScript本格入門                             |
| アプリを作ろう！ Android入門                           |
| アプリを作ろう！ Visual C++入門                        |
| はじめてのJSP&サーブレット 第2版                       |
| プログラマのためのDocker教科書                         |
| 独習ASP.NET 第5版                                      |
| 独習PHP 第3版                                          |
+--------------------------------------------------------+
10 rows in set (0.001 sec)

select publish from books;
+--------------------+
| publish            |
+--------------------+
| 技術評論社         |
| 技術評論社         |
| 技術評論社         |
| 技術評論社         |
| 日経BP社           |
| 日経BP社           |
| 秀和システム       |
| 翔泳社             |
| 翔泳社             |
| 翔泳社             |
+--------------------+
10 rows in set (0.001 sec)
```

なので、Rails 側でも select で呼び出すと文字の昇順となている

```rb
> Book.select(:title)
=>   Book Load (0.8ms)  SELECT `books`.`title` FROM `books`
[#<Book:0x000055f3e655b740 id: nil, title: "AngularJSアプリケーションプログラミング">,
 #<Book:0x000055f3e655b600 id: nil, title: "Javaポケットリファレンス">,
 #<Book:0x000055f3e655b4c0 id: nil, title: "Swiftポケットリファレンス">,
 #<Book:0x000055f3e655b380 id: nil, title: "改訂新版JavaScript本格入門">,
 #<Book:0x000055f3e655b240 id: nil, title: "アプリを作ろう！ Android入門">,
 #<Book:0x000055f3e655b100 id: nil, title: "アプリを作ろう！ Visual C++入門">,
 #<Book:0x000055f3e655afc0 id: nil, title: "はじめてのJSP&サーブレット 第2版">,
 #<Book:0x000055f3e655ae80 id: nil, title: "プログラマのためのDocker教科書">,
 #<Book:0x000055f3e655ad40 id: nil, title: "独習ASP.NET 第5版">,
 #<Book:0x000055f3e655ac00 id: nil, title: "独習PHP 第3版">]

> Book.select(:publish)
=>   Book Load (0.8ms)  SELECT `books`.`publish` FROM `books`
[#<Book:0x000055f3e659a170 id: nil, publish: "技術評論社">,
 #<Book:0x000055f3e659a030 id: nil, publish: "技術評論社">,
 #<Book:0x000055f3e6599ef0 id: nil, publish: "技術評論社">,
 #<Book:0x000055f3e6599db0 id: nil, publish: "技術評論社">,
 #<Book:0x000055f3e6599c70 id: nil, publish: "日経BP社">,
 #<Book:0x000055f3e6599b30 id: nil, publish: "日経BP社">,
 #<Book:0x000055f3e65999f0 id: nil, publish: "秀和システム">,
 #<Book:0x000055f3e65998b0 id: nil, publish: "翔泳社">,
 #<Book:0x000055f3e6599770 id: nil, publish: "翔泳社">,
 #<Book:0x000055f3e6599630 id: nil, publish: "翔泳社">]
```

ここから title と publish を remove_index してみる。(title だけ remove_index はできない)

すると DB で呼び出すと以下のように整列されず、id 昇順になっていることがわかる。

つまり idex が削除できたということ。

```sql
MySQL [app_development]> select id, title, publish from books;
+----+--------------------------------------------------------+--------------------+
| id | title                                                  | publish            |
+----+--------------------------------------------------------+--------------------+
|  1 | 改訂新版JavaScript本格入門                             | 技術評論社         |
|  2 | はじめてのJSP&サーブレット 第2版                       | 秀和システム       |
|  3 | Javaポケットリファレンス                               | 技術評論社         |
|  4 | アプリを作ろう！ Visual C++入門                        | 日経BP社           |
|  5 | アプリを作ろう！ Android入門                           | 日経BP社           |
|  6 | 独習PHP 第3版                                          | 翔泳社             |
|  7 | Swiftポケットリファレンス                              | 技術評論社         |
|  8 | プログラマのためのDocker教科書                         | 翔泳社             |
|  9 | AngularJSアプリケーションプログラミング                | 技術評論社         |
| 10 | 独習ASP.NET 第5版                                      | 翔泳社             |
+----+--------------------------------------------------------+--------------------+
10 rows in set (0.001 sec)
```

### 外部キー制約を追加/削除 add_foreign_key メソッド

外部キー制約を追加するのは add_foreign_key メソッドの役割。

- add_foreign_key メソッド

```
add_foreign_key(tname,fname [,opt])
------------------------------------
tname: テーブル名 frname: 参照先のテーブル名
opt: 外部キーオプション
```

- 主な外部キーオプション

| オプション  | 概要                                             |
| ----------- | ------------------------------------------------ |
| column      | 外部キー列の名前(デフォルトは参照先テーブル\_id) |
| primary_key | 参照先テーブルの主キー名(デフォルトは id)        |
| name        | 制約名                                           |
| on_delete   | 削除時の挙動                                     |
| on_update   | 更新時の挙動                                     |

on_delete/on_update オプションは参照先テーブルが更新/削除された場合の参照元テーブルの挙動を指定するための設定。

- on_delete/on_update オプションの設定値

| 設定値    | 概要                                       |
| --------- | ------------------------------------------ |
| :nullify  | 参照列の値を null に設定                   |
| :cascade  | 対応するレコードの値を更新                 |
| :restrict | 外務キー制約違反のエラーを通知(デフォルト) |

```rb
add_foreign_key :reviews, :books # 1
add_foreign_key :reviews, :books, on_update: :cascade, on_delete: :nullify #2
```

1 はもっともシンプルな例で、reviews テーブルから books テーブルを参照するための外部キー列 book_id に対して、外部キー制約を設定する。

on_update/on_delete オプションのデフォルト値は:restrict なので、この状態で books テーブルのレコードを削除した場合、外務キー制約でエラーになる。

2 は明示的に on_update/on_delete オプションを指定した例。

on_update では:cascade が設定されているので、books テーブルの変更によって対応する reviews テーブルの外部キーも更新される。

一方、on_delete には:bullify が設定されているので、books テーブルのレコードが削除することで、reviews テーブルの外部キー列には null がセットされる。

このように、外部キー制約を設定することで、テーブル同志の整合関係を自動的に維持できる。

[t.reference や外部キー制約についての参考](https://qiita.com/ryouzi/items/2682e7e8a86fd2b1ae47)

ちなみに以下のように reviews のマイグレーションは設定されいる

- db/migrate/20200623154338_create_reviews.rb

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

上記の状態で book を削除しようとするとエラーになる。

```rb
> Book.first.delete
  Book Load (0.8ms)  SELECT  `books`.* FROM `books` ORDER BY `books`.`id` ASC LIMIT 1
  Book Destroy (7.0ms)  DELETE FROM `books` WHERE `books`.`id` = 1
ActiveRecord::StatementInvalid: Mysql2::Error: Cannot delete or update a parent row: a foreign key constraint fails (`app_development`.`reviews`, CONSTRAINT `fk_rails_924a0b30ca` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)): DELETE FROM `books` WHERE `books`.`id` = 1
from /usr/local/bundle/gems/mysql2-0.5.3/lib/mysql2/client.rb:131:in `_query'
Caused by Mysql2::Error: Cannot delete or update a parent row: a foreign key constraint fails (`app_development`.`reviews`, CONSTRAINT `fk_rails_924a0b30ca` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`))
from /usr/local/bundle/gems/mysql2-0.5.3/lib/mysql2/client.rb:131:in `_query'
```

なので、on_delete: :cascade を入れる。こうすることで親の変更があっても一緒に更新がされるので

なので、depedent: :destory など宣言せずとも book を削除すると紐づくレビューも削除される

```rb
class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :book, foreign_key: {on_delete: :cascade}
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :body

      t.timestamps
    end
  end
end
```

```rb
> Book.first.delete
/usr/local/bundle/gems/activerecord-5.2.4.3/lib/active_record/associations.rb:1855: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/usr/local/bundle/gems/activerecord-5.2.4.3/lib/active_record/associations.rb:1368: warning: The called method `has_many' is defined here
   (0.5ms)  SET NAMES utf8,  @@SESSION.sql_mode = CONCAT(CONCAT(@@sql_mode, ',STRICT_ALL_TABLES'), ',NO_AUTO_VALUE_ON_ZERO'),  @@SESSION.sql_auto_is_null = 0, @@SESSION.wait_timeout = 2147483
/usr/local/bundle/gems/activerecord-5.2.4.3/lib/active_record/connection_adapters/mysql/database_statements.rb:12: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/usr/local/bundle/gems/activerecord-5.2.4.3/lib/active_record/connection_adapters/abstract/query_cache.rb:95: warning: The called method `select_all' is defined here
  Book Load (0.5ms)  SELECT  `books`.* FROM `books` ORDER BY `books`.`id` ASC LIMIT 1
/usr/local/bundle/gems/activemodel-5.2.4.3/lib/active_model/type/integer.rb:13: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/usr/local/bundle/gems/activemodel-5.2.4.3/lib/active_model/type/value.rb:8: warning: The called method `initialize' is defined here
  Book Destroy (2.0ms)  DELETE FROM `books` WHERE `books`.`id` = 1

  Review.first
  Review Load (0.4ms)  SELECT  `reviews`.* FROM `reviews` ORDER BY `reviews`.`updated_at` DESC LIMIT 1
=> #<Review:0x0000562cf2a0e928
 id: 3,
 book_id: 2,
 user_id: 2,
 status: "draft",
 body: "とても役に立ちます。サンプルたくさん紹介されていてお勧めの一冊です。",
 created_at: Sun, 29 Nov 2020 07:28:42 UTC +00:00,
 updated_at: Sun, 29 Nov 2020 07:28:42 UTC +00:00>
```

今度は rollback して on_delete: :nullify を入れてみる

```rb
class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :book, foreign_key: { on_delete: :nullify }
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :body

      t.timestamps
    end
  end
end
```

```rb
)> Book.first
id: 1,
 isbn: "978-4-7741-8411-1",
 title: "改訂新版JavaScript本格入門",
 price: 2980,
 publish: "技術評論社",
 published: Fri, 30 Sep 2016,
 dl: false,
 created_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00,
 updated_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00>

 > Book.first.reviews
 [#<Review:0x000055c992ddec38
  id: 1,
  book_id: 1,
  user_id: 2,
  status: "draft",
  body: "JavaScriptを使うなら、まず、目を通しておきたい本ですね。",
  created_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00,
  updated_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00>,
 #<Review:0x000055c992dc5788
  id: 2,
  book_id: 1,
  user_id: 3,
  status: "published",
  body: "JavaScriptの基本を振り返りたいときにはこの本を頼りにしています。",
  created_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00,
  updated_at: Sun, 29 Nov 2020 06:57:41 UTC +00:00>]


Book.first.delete
  Book Load (0.8ms)  SELECT  `books`.* FROM `books` ORDER BY `books`.`id` ASC LIMIT 1
  Book Destroy (2.6ms)  DELETE FROM `books` WHERE `books`.`id` = 1
=> #<Book:0x0000559339480f90
 id: 1,
 isbn: "978-4-7741-8411-1",
 title: "改訂新版JavaScript本格入門",
 price: 2980,
 publish: "技術評論社",
 published: Fri, 30 Sep 2016,
 dl: false,
 created_at: Sun, 29 Nov 2020 07:01:15 UTC +00:00,
 updated_at: Sun, 29 Nov 2020 07:01:15 UTC +00:00>

pry(main)> Review.first
  Review Load (0.7ms)  SELECT  `reviews`.* FROM `reviews` ORDER BY `reviews`.`updated_at` DESC LIMIT 1
=> #<Review:0x000055933a135330
 id: 1,
 book_id: nil,
 user_id: 2,
 status: "draft",
 body: "JavaScriptを使うなら、まず、目を通しておきたい本ですね。",
 created_at: Sun, 29 Nov 2020 07:01:15 UTC +00:00,
 updated_at: Sun, 29 Nov 2020 07:01:15 UTC +00:00>
```

### 任意の SQL 命令を実行する execute メソッド

マイグレーションファイルには様々なメソッドが提供されている。

基本的なスキーマ定義はおおよそまかなうことができるが、それでも全ての SQL 命令をサポートしているわけではない。

たとえばマイグレーションでは、ENUM、GEOGRAPHY、XLM などのデータベース固有の特殊型はもちろん、CHAR、NVARCHAR、LONGTEXT など表現できない型は多くある。

また、CHECK 制約やデータベースオプジェクトのビューやトリガーの作成も対応していない。

これらを表現したいケースでは excute メソッドで直接 SQL 命令を記述する必要がある.

たとえば、以下は books テーブルから技術評論社の書籍だけを取り出した gihyo_books ビューを定義する例。

```rb
execute "CREATE VIEW gihyo_books AS SELECT * FROM books WHERE publish ='技術評論社'"
```

ただし excute メソッドは往々にしてマイグレーションファイルの可搬性を損なう可能性がある。

例えば SQLLite で動作する SQL 命令が必ず MySQL で動作するとは限らない。

あくまで最終的な手段として利用すべき。

まずは標準的なメソッドでの操作を検討すべき。

### HABTM 中間テーブルを生成する create_join_table メソッド

HBTM(has_and_belogs_to_many)関係とは m:n の関係のこと。

create_join_tabel メソッドは HABTM 関係での中間テーブルを作成する

- create_join_table メソッド

```
create_join_table(table1, table2, [,opts])
------------------------------------------
table1, table2: 紐づけるテーブル opts: 中間テーブルオプション
```

中間テーブルは、外部キー以外の列を持ってないという制約があるが、create_join_table メソッドを利用すれば、中間テーブルをもたずに多対多が実現できる。

- db/migrate/20200623152808_create_join_table_author_book.rb

```rb
class CreateJoinTableAuthorBook < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
      # t.index [:aouthor_id, :book_id]
      # t.index [:book_id, :aouthor_id]
    end
  end
end
```

## マイグレーションファイルの実行

マイグレーションファイルを実行するには、rails コマンドを利用する。

未実行のマグレーションファイルを実行するには以下。

```
$ rails db:migrate
```

rails db:migrate コマンドは、schema_migrations テーブルと現在の db/migrate フォルダーとを比較し、未実行のマイグレーションファイルを検出&実行する。

他にも rails コマンドでは様々なサブコマンドを提供している。

- マイグレーション関連の rails コマンド

| コマンド         | 概要                                                                                           | 例                                                         |
| ---------------- | ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| db:migrate       | 指定されたバージョンまで移行(VERSION 未指定の場合、最新に)                                     | rails db:migrate VERSION=2016205000859                     |
| db:rollback      | 指定ステップだけバージョンを戻す                                                               | rails db:rollback STEP=5                                   |
| db:migrate:redo  | 指定ステップだけバージョンを戻して、再度実行                                                   | rails db:migrate:redo STEP=5                               |
| db:migrate:reset | データベースをいったん削除し、再作成した上で、最新バージョンとなるようなマイグレーションを作成 | rails:db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHEK=1 |

### RAILS_ENV オプション

rails コマンドでは、デフォルトで database.yml で定義された開発データベースにに対して処理を行う。

もしもテストデータベースや本番データベースに対しても処理を行いたい場合には、以下のように RAILS_ENV オプションを指定する。

```
$ rails db:migrate RAILS_ENV=test
```

### VERBOSE オプション

rails コマンドは、デフォルトでマイグレーションの処理過程を詳細に通知する。

これらの出力を停止したいならば、以下のように VERBOSE オプションに false をセットする。

```
$ rails db:migrate VERBOSE=false
```

#### 出力の制御

マイグレーションファイルの側で任意のメッセージを出力したり、一部のメッセージを停止したりすることもできる

- 2020xxxxxx_add_author_to_books.rb

```rb
def change
  say 'Add birth column to authors table.'
  supper_messages do
    add_colum :authors, :birth, :date
  end
end
```

## リバーシブルなマイグレーションファイル

マイグレーションのルールを記述する基本は、まずは change メソッド。

Rails の change メソッドは賢くできており、スキーマをバージョンアップ(更新)する場合はもちろん、前のバージョンに戻す場合にも、自動的に「逆の処理」を生成し、特定の状態までロールバックしてくれる。

もっとも、すべてのケースでロールバックが可能というわけではない。

たとえば、drop_table メソッドは標準ではロールバックできない(=テーブルを再作成できない)。

「hoge テーブルを削除する」という情報だけでは、どんな hoge テーブルを作成して良いか、Rails が判断できないため。

標準でロールバック可能なメソッドは以下のとおり。

- add_column
- add_index
- add_reference
- add_timestamps
- change_table
- create_table
- creata_join_table
- remove_timestamps
- rename_column
- rename_index
- remove_reference
- rename_table

それ以外のメソッドを change メソッドに含んでいる場合には、以下のような方法で対処する。

### ロールバックのための情報を追加する remove_column/drop_table

そのままではロールバックに対応していないが、情報を追加することでロールバックできるようなるメソッドがある。

それは remove_column/drop_table メソッド。

remove_column メソッドは削除する列の情報を引数で明記しておくと、ロールバック可能になる。

- 2020xxxxxx_remove_birth_from_authors.rb

```rb
def change
  remove_column :authors, :birth, :date
  # 「remove_column :authors, :birth」ではデータ型が不明なのでロールバック不可
end
```

よく似たメソッドとして、複数列をまとめて削除できる remove_columns メソッドもあるが、こちらは列情報を指定できないため、ロールバックできない。

また、drop_table メソッドも、削除すべきテーブルの列情報を明示しておくことで、ロールバック可能になる。

ブロック配下の列定義については、create_table メソッドに準ずる。

### バージョンアップ/ダウンの処理を分岐する reversible メソッド

reversible メソッドを利用することで、change メソッドの中でバージョンアップ時の処理とバージョンダウン時の処理を分岐して記述できるようになる。

- reversible メソッド

```rb
reversible do |dir|
  dir.up do
    ...statements_up...
  end
  dir.down do
    ...statements_down...
  end
end
```

```
dir: マイグレーション処理を管理するためのオブジェクト
statements_up: バージョンアップ時の処理
statements_down: バージョンダウン時の処理
```

books テーブルを作成するさいに、併せて「技術評論社の書籍だけを抜き出した gihyo_books ビュー作成する」例。

マイグレーションではビューを生成するためのメソッドではないので、excute メソッドはロールバック不可のメソッドなので、reversible メソッドで、それぞれビューを追加/削除するための処理を表す。

- 2020xxxxxx_create_books.rb

```rb
class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      ...中略...
    end

    reversible do |dir|
      dir.up do
        execute 'CREATE VIEW gihyo_books AS SELECT * FROM books WHERE publish = "技術評論社"'
      end
      dir.down do
        execute 'DROP VIEW gihyo_books'
      end
    end
  end
end
```

### バージョンアップ/ダウンのを分岐する up/down メソッド

change メソッドの代わりに、バージョンアップ/ダウン時の jino(これまでの change メソッド)を、down メソッドがバージョンダウン時の処理をそれぞれ表す。

たとえば先ほどのリストを up/down メソッドで表したのが、リスト。

- 2020xxxxxx_create_books.rb

```rb
class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|
      ...中略...
    end
    execute 'CREATE VIEW gihyo_books AS SELECT * FROM books WHERE publish = "技術評論社"'
  end

  def down
    drop_table :books
    execute 'DROP VIEW gihyo_books'
  end
end
```

reversible メソッドと up/down メソッドはあ互いに置き換え可能。

いずれを利用するかは、全体のうち、どの程度がロールバック可能かによって判断すること。

処理のすべて(もしくは大部分)がロールバックできない場合には、up/down メソッドに分離した方が可読性は向上する。

一方、ロールバックできない処理が一部だけの場合は、そこだけを reversible メソッドで二重化した方がコードは短くまとめられる。

いずれを利用すべきかは一概にはいえないが、後々のコードの読みやすさを考え、なんでも reversible メソッドに詰め込むのはさけること。

## スキーマファイルによる再構築

マイグレーションは、とても便利な仕組みだが、1 からデータベースを再構築する上で最適なツールとは言えない。

変更の履歴をすべて追うのは効率的でないだけでなく、予期せぬエラーを発生させる原因にもなる。

そこで Rails では、スキーマの更新履歴を表すマイグレーションファイルとは別に最新のスキーマ情報を表すスキーマファイル(db/schema.rb)を用意している。

中身を確認するとわかるが、スキーマファイルとは要するにマイグレーションファイルの集合。

- schema.rb

```rb
ActiveRecord::Schema.define(version: 2020_11_29_045813) do

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.date "birth"
    t.text "address"
    t.string "ctype"
    t.binary "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "authors_books", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.integer "price"
    t.string "publish"
    t.date "published"
    t.boolean "dl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  :
  :
end
```

マイグレーションの実行によって自動的に更新され、最新のスキーマ情報を Ruby スクリプトとして表現している。

スキーマファイルは一からデータベースを再構築する場合はもちろん、既存のデータベースを異なるデータベースに対応するアプリを配布する場合などに有用である。

また現在のスキーマ情報を一望したい場合にも、スキーマファイルは利用できる。

スキーマファイルをデータベースに展開することは以下のようにしている。

```
$ rails db:schema:load
-- create_table("authors", {:force=>true})
-> 0.461s
 ...中略...
-- initialize_schema_migrations_table()
-> 0.0030s
```

現在のデータベースを破棄して、最新のスキーマ情報で再構築したいならば以下のようにしても構わない。

```
$ rails db:reset
```

冒頭で述べたように、スキーマファイルは自動的に更新されるが、手動で出力することもできる。

なんらかの事情でマイグレーションを経由せずにスキーマを更新した場合(本来避けるべき)や、既存のデータベースからスキーマファイルを生成したいという場合に利用できる。

```
> rails db:schema:dump
```

#### .sql ファイルを作成する方法

データベースの現在のスキーマを(Ruby スクリプトとしてでなく)SQL スクリプトとして取得したい場合には、以下のようにする。

データベース固有のオブジェクトも併せてダンプしたい場合には、こちらの方法を利用する必要がある。

```
$ rails db:structure:dump
```

## データの初期化

スキーマが準備できたら、データを初期化する必要がある。

Rails では初期化するために、シードファイルとフィクスチャという 2 つのアプローチを提供している。

いずれも rails コマンド経由でデータベースにデータを提供するため、使い分けが曖昧になりやすいが、もともとフィクスチャ(fixture)とはソフトウェア用語でテスト時のアプリの初期状態のことを、シード(seed)とは英語で種のことを、それぞれ意味する。

語源からすれば、フィクスチャはテストデータの投入に、シードファイルはマスターテーブルなどの初期データを投入するために利用するのが基本と考えれば良い。

### シードファイル

シードファイルは、単なる Ruby のスクリプトコードにすぎない。

よって、新たに覚えなければならないというものはなく、ただ Ruby(Active Record)でデータを生成/保存するコードを記述していくだけで OK。

作成したコードは、db/seed.rb として保存する。

たとえば以下は books テーブルにデータを投入するためのコード。

- seed.rb

```rb
Book.create(id: 1, isbn:'978-4-7741-8411-1', title: '改訂新版JavaScript本格入門', price: 2980, publish: '技術評論社', published: '2016-09-30', dl: false)
Book.create(id: 2, isbn: '978-4-7980-4803-1', title: 'はじめてのJSP&サーブレット 第2版', price: 2800, publish: '秀和シシテム', published: '2016-09-27', dl: false)
Book.create(id: 3, isbn: '978-4-7741-8030-4', title: 'Javaポケットリファレンス', price: 2680, publish: '技術評論社', published: '2016-03-18', dl: true)
```

作成したシードファイルは、rails コマンドによって実行できる。

```
$ rails db:seed
```

データベースの作成からスキーマの構築、初期データの投入までをまとめて行いたいならば、以下のようにすることもできる。

```
$ rails db:setup
```

### フィクスチャ

純粋な Ruby スクリプトであるシードファイルに対して、フィクスチャファイルは YAML 形式で記述できる。

以下ば books テーブルに投入することを想定したフィクスチャ。

フィクスチャファイルは test/fixtures フォルダー配下に「テーブル名.yml」という名前で保存する。

- book.yml

```yml
modernjs:
  id: 1
  isbn: 978-4-7741-8411-1
  title: 改訂新版JavaScript本格入門
  price: 2980
  publish: 技術評論社
  published: 2016-09-30
  dl: false

jsp:
  id: 2
  isbn: 978-4-7980-4803-1
  title: はじめてのJSP&サーブレット 第2版
  price: 2800
  publish: 秀和システム
  published: 2016-09-27
  dl: false

java:
  id: 3
  isbn: 978-4-7741-8030-4
  title: Javaポケットリファレンス
  price: 2680
  publish: 技術評論社
  published: 2016-03-18
  dl: true
  :
  :
 ...攻略...
```

レコードを識別するラベル(ここでは jsp:など)の配下に、「フィールド名:値」の形式で定義するわけである。

YAML 形式のインデントは、タブ文字ではなく空白(一般的には半角スペース 2 個)で表現しなければならない点に注意すること。

フィクスチャファイルでは、外部キーもシンプルに記述できる。

たとえば、users テーブルと、これを参照する reviews テーブルであれば、以下のように記述できる。

- user.yml

```yml
yyamada:
  id: 1
  username: yyamada
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: yyamada@wings.msn.to
  dm: true
  roles: admin,manager
  reviews_count: 2

isatou:
  id: 2
  username: isatou
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: isatou@wings.msn.to
  dm: false
  roles: admin
  reviews_count: 2

hsuzuki:
  id: 3
  username: hsuzuki
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: hsuzuki@wings.msn.to
  dm: true
  roles: manager
  reviews_count: 2

tyamamoto:
  id: 4
  username: tyamamoto
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: tyamamoto@wings.msn.to
  dm: false
  roles: member
  reviews_count: 1

shayashi:
  id: 5
  username: shayashi
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: shayashi@wings.msn.to
  dm: true
  roles: member
  reviews_count: 2

nkakeya:
  id: 6
  username: nkakeya
  password_digest: $2a$10$uTwYyniemA7y7.z80yw17uqmRzN/LggEoSzUe.tXGdCUWPvYp9M2m
  email: nami-piano@nifty.com
  dm: true
  roles: manager,member
  reviews_count: 0
  :
  :
```

- reviews.yml

```yml
modernjs_1:
  book: modernjs
  user: isatou
  status: 0
  body: JavaScriptを使うなら、まず、目を通しておきたい本ですね。

modernjs_2:
  book_id: modernjs
  user_id: hsuzuki
  status: 1
  body: JavaScriptの基本を振り返りたいときにはこの本を頼りにしています。

jsp_1:
  book: jsp
  user: isatou
  status: 0
  body: とても役に立ちます。サンプルたくさん紹介されていてお勧めの一冊です。

jsp_2:
  book: jsp
  user: tyamamoto
  status: 1
  body: 丁寧に書かれています。サンプルも多く、分かりやすくて良いです。
  :
  :
```

外部キーが「モデル名:参照先のラベル」の形式で表現されている点に注目。

本来であれば、user_id 列には users テーブルの対応する id 値が瀬戸されるべきだが、常に参照先のテーブルの id 値を意識していなければならないというのも面倒。

そもそも users テーブルの情報を変更した場合などは id 値も変化してしまう可能性がある。

これは望ましい状況ではないので、ラベルで持って参照先を識別する。

これによって、本来の id 値の意識することなく、両者を関連付けることができる。

なお、ラベルによる関連付けを行う場合は、users.yml 側で id 値は明示せず、Rails で自動採番させるようにしないといけない。

作成したフィクスチャファイルは、rails コマンドによって実行できる。

```
$ rails db:fixtures:load
```

FIXTURES オプションを省略した場合には、/text/fixtures フォルダー配下のすべてのフィクスチャが展開される。

また、現在の環境(デフォルトは開発環境)以外にフィクスチャを展開したい場合には、マイグレーションのときと同じく「RAILS_ENV=prduction」のようなオプションを付与する。

#### フィクスチャで大量データを生成する

フィクスチャでは、テンプレートではファイルのようにスクリプトブロックを埋め込むこともできない。

これによって、一定の規則をもった大量を一気に作成することが可能になる。

例えば、以下のように 0~9 の番号が振られた書籍データを生成する例。

- books.yml

```yml
<% 0.upto(9) do |n| %>
book<%= n %>:
isbn: 978-4-7741-5878-<%= n %>
title: 書名タイトル<%= n %>
price: <%= 1000 + n %>
publish: 出版社<%= n %>
published: 2020-12-1
<% end %>
```

#### 日付/時刻に関する便利なメソッド

Active Support では、標準の Date/Time オブジェクトを拡張して、より簡単に相対的な日付を取得できる。

たとえば、「Time.now.yesterday」で昨日の日付を求めることができる。

特に、以下で挙げるものはよく利用する。

- 日付/時刻に関する便利なメソッド

| メソッド          | 概要                                                 |
| ----------------- | ---------------------------------------------------- |
| yesterday         | 昨日                                                 |
| tomorrow          | 明日                                                 |
| prev_xxx          | 前年/月/週(xxxx は year、month、week)                |
| next_xxx          | 翌年/月/週(xxxx は year、month、week)                |
| beginning_of_xxxx | 年/四半期/月/週の最初の日(xxxx は year、month、week) |
| end_of_xxxx       | 年/四半期/月/週の最後の日(xxxx は year、month、week) |

また、日付/時間の間隔を求めるならば、「3.months.ago」(3 ヶ月前)、「3.months.from_now」(3 ヶ月後)のように Numeric オブジェクトのメソッドとして表現できる。

太字の部分は、単位に応じて以下のものも利用できる(month のような単数形を可)。

#### ドキュメンテーションコメントで仕様書を作成する RDoc

ドキュメンテーションコメントとは、ファイルの先頭やクラス/メソッド宣言などの直前に記述し、クラス/メンバーの説明を記述するための「特定のルールに則った」コメントのこと。

Ruby の標準ツールである RDoc(Ruby Documentation System)を利用することで、API ドキュメントを自動生成できるのが特徴。

ソースコードと一体で管理されているので、ソースと説明の同期を取りやすいというメリットがある。

あとからコードを読みやすくするという意味でも、最低限、ドキュメンテーションコメントに沿ったコメントくらいは残しておく癖を付けておきたいもの。

以下はドキュメンテーションの例。

ドキュメンテーションコメントとは言っても記法自体は通常のコメント構文がベースとなっているため、ごく直感的に記述できる。

固有の決まりもあるが、まずはサンプルの内容を理解しておけば、日常的な記述には困らない。

![スクリーンショット 2020-12-02 22.53.57.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/547448/43f032f1-8344-c75f-5208-bee2ba821d39.png)

作成したコメントは rdoc コマンドでドキュメント化できる。

以下は README.md をトップページに、/app、/lib フォルダー配下の.rb ファイルをドキュメント化する、という意味。

自動生成されたドキュメントには、アプリルート配下の/doc/app/index.html からアクセスする。

```
rdoc --mail README.md README.md
app/**/*.rb lib/**/*.rb
```
