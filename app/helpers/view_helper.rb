module ViewHelper
  # datetime: 整形対象の日付時刻値(Timeオブジェクト)
  # type: 出力形式(日付時刻: datetime, 日付のみ: date, 時刻のみ: time)
  def format_datetime(datetime, type = :datetime)
    return '' unless datetime

    case type
      when :datetime
        format = '%Y年%m月%d日 %H:%M:%S'
      when :date
        format = '%Y年%m月%d日'
      when :time
        format = '%H:%M:%S'
    end

    datetime.strftime(format)
  end

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

  def list_tag2(collection, prop)
    list = '<ul>'
    collection.each do |element|
      list.concat('<li>')
      list.concat(h element.attributes[prop])
      list.concat('</li>')
    end
    raw list.concat('</ul>')
  end

  def blockquote_tag(cite, citetext, options = {}, &block)
    #引数optionsに引数citeで指定された引用元URLを追加
    options.merge! cite: cite
    #blockquote要素を生成
    quote_tag = content_tag(:blockquote, capture(&block), options)
    #引用元を表すp要素を生成
    p_tag = content_tag(:p) do
      concat '出典：'
      concat content_tag(:cite, citetext)
    end
    #blockquote要素とp要素とを連結した結果を変えす
    quote_tag.concat(p_tag)
  end

  def blockquote_tag2(cite, citetext, body = '', options = {}, &block)
    options.merge! cite: cite
    quote_tag = content_tag(:blockquote,
      block_given? ? capture(&block) : body,
      options)
  end
end
