class RecordController < ApplicationController
  def find
    @books = Book.find([2,5,10])
    render 'hello/list'
  end

  def find_by
    @book = Book.find_by(publish: "技術評論社")
    render 'books/show'
  end

  def find_by2
    @book = Book.find_by(publish: '技術評論社', price: 2980)
    render 'books/show'
  end

  def where
    @books = Book.where(publish: '技術評論社')
    render 'hello/list'
  end

  def ph1
    @books = Book.where('publish =? AND price >= ?', params[:publish], params[:price])
    render 'hello/list'
  end

  def not
    @books = Book.where.not(isbn: params[:id])
    render 'books/index'
  end

  def where_or
    @books = Book.where(publish: '技術評論社').or(Book.where('price > 2000'))
    render 'hello/list'
  end

  def order
    @books = Book.where(publish: '技術評論社').order(published: :desc)
    render 'hello/list'
  end

  def reorder
    @books = Book.order(:publish).reorder(:price)
    render 'books/index'
  end

  def select
    @books = Book.where('price >= 2000').select(:title, :price)
    render 'hello/list'
  end

  def select2
    @pubs = Book.select(:publish).distinct.order(:publish)
  end

  def offset
    @books = Book.order(published: :desc).limit(3).offset(4)
    render 'hello/list'
  end

  def page
    page_size = 3 # ページ当たりの表示件数
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1 # 現在のページ数
    @books = Book.order(published: :desc).limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end

  def last
    @book = Book.order(published: :desc).last
    render 'books/show'
  end

  def groupby
    @books = Book.select('publish, AVG(price) AS avg_price').group(:publish)
  end

  def havingby
    @books = Book.select('publish,AVG(price) AS avg_price').group(:publish).having('AVG(price) >= ?',2500)
    render 'record/groupby'
  end

  def where2
    @books = Book.all
    @books.where!(publish: '技術評論社')
    @books.order!(:published)
    render 'books/index'
  end

  def unscope
    @books = Book.where(publish: '技術評論社').order(:price).select(:isbn, :title).unscope(:where, :select)
    render 'books/index'
  end

  def unscope2
    @books = Book.where(publish: '技術評論社', dl: true).order(:price).unscope(where: :dl)
    render 'books/index'
  end

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

  def pluck
    render plain: Book.where(publish: '技術評論社').pluck(:title, :price)
  end

  def exists
    flag = Book.where(publish: '新評論社').exists?
    render plain: "存在するか? : #{flag}"
  end

  def scope
    @books = Book.gihyo.top10
    render 'hello/list'
  end

  def def_scope
    render plain: Review.all.inspect
  end

  def count
    cnt = Book.where(publish: '技術評論社').count
    render plain: "#{cnt}件です."
  end

  def average
    price = Book.where(publish: '技術評論社').average(:price)
    render plain: "平均価格は#{price}円です。"
  end

  def literal_sql
    @books = Book.find_by_sql(['SELECT publish, AVG(price) AS avg_price FROM books GROUP BY publish HAVING AVG(price) >=?', 2500])
    render 'record/groupby'
  end

  def update_all
    cnt = Book.where(publish: '技術評論社').update_all(publish: 'Gihyo')
    render plain: "#{cnt}件のデータを更新しました。"
  end

  def update_all2
    cnt = Book.order(:published).limit(5).update_all('price = price * 0.8')
    render plain: "#{cnt}件のデータを更新しました。"
  end

  def destroy_all
    Book.where.not(publish: '技術評論社').destroy_all
    render plain:'削除完了'
  end

  def enum_rec
    @review = Review.find(1)
    @review.published!
    render plain: 'ステータス:' + @review.status
  end

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

  def has_and_belongs
    @book = Book.find_by(isbn: '978-4-7980-4803-1')
  end

  def cache_counter
    @user =User.find(1)
    render plain: @user.reviews.size
  end

  def memorize
    @book = Book.find(1)
    @memo = @book.memos.build({ body: 'あとで買う' })
    if @memo.save
      render plain: 'メモを作成しました。'
    else
      render plain: @memo.errors.full_messages[0]
    end
  end

  def assoc_join
    @books = Book.joins(:reviews, :authors).
     order('books.title, reviews.updated_at').
     select('books.*, reviews.body, authors.name')
  end

  def assoc_join2
  @books = Book.joins(reviews: :user).
     select('books.*, reviews.body, users.username')
  end

  def assoc_join3
    @books = Book.joins('LEFT OUTER JOIN reviews ON reviews.book_id = books.id').
      select('books.*, reviews.body')
  end

    # left_outer_joinsメソッドの場合
  def assoc_join4
    @books = Book.left_outer_joins(:reviews).select('books.*, reviews.body')
    render 'assoc_join3'
  end

  def assoc_includes
    # @books = Book.includes(:reviews).all
    @books = Book.all
  end

  def attr
    @book = Book.find(1)
    render plain: @book.price.class
  end
end
