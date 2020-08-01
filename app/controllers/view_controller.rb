class ViewController < ApplicationController
  def detail
  end

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

  def default_url_options(options = {})
    { charset: 'utf-8' }
  end

  def adopt
    render layout: 'sub'
  end

  def multi
    render layout: 'layout'
  end

  def nest
    @msg = '今日も良い天気です。'
    render layout: 'child'
  end

  def partial_basic
    @book = Book.find(1)
  end

  def partial_param
    @book = Book.find(1)
  end

  def partial_col
    @books = Book.all
  end

  def partial_spacer
    @books = Book.all
  end
end
