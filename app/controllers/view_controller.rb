class ViewController < ApplicationController
  def select
    @book = Book.new(publish: '技術評論社')
  end

  def html5
    @book = Book.new
  end

  def field
    @book = Book.new
  end

  def form_tag
    @book = Book.new
  end

  def col_select
    # フォームの元となるモデルの準備
    @book = Book.new(publish: '技術論社')
    #選択オプションの情報を取得
    @books = Book.select(:publish).distinct
  end

  def group_select
    @review = Review.new
    @authors = Author.all
  end

  def dat_select
    @book = Book.find(1)
  end

  def col_radio
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end

  def fields
    @user = User.find(1)
  end

  def conc
    @books = Book.all
  end
end
