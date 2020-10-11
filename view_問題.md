# 問題

1. form_for と form_tag の違いは?

1. form_for のヘルパーの中で、メールアドレスを入力と電話番号入力に理想的なヘルパーはそれぞれなんでしょう？理由も答えなさい。

1. 選択ボックスを生成するには select メソッドを使いますが、選択ボックスをリストボックスに変える方法はなんでしょう？

1. 選択ボックスの選択肢を他のテーブルと関連付けし、グループ化するメソッドはなんでしょう？

1. form_for ブロックの中で、関連した異なるモデルを登録したり、編集に使うメソッドはなんでしょう？

1. 文字列を指定桁で切り捨てるメソッドはなんでしょう？

1. 文字列から要素と属性を除去できるメソッドがあります。そのメソッドはなんでしょう?

1. number_to_xxx メソッドをを様々な数字の表現ができます。12345 を 123,45 円にすにはどのように記述すればいいでしょう？

1. <p id="exam" class="body">今日もいい天気</p>このようなhtmlをveiwヘルパーを使って1行で記述してください。

# 解答

1. form_for は特定のモデルオブジェクトを編集するのに特化したメソッド、form_tag はモデルに関係しない汎用的なフォームを生成するためのメソッド

   [フォーム生成の基礎](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E7%94%9F%E6%88%90%E3%81%AE%E5%9F%BA%E7%A4%8E)

1. メールアドレスの入力フォームは email_field、電話番号は telephone_field を使うとよい。

   理由はどちらも携帯電話で入力するさいに、email_field は英数字入力フォームが表示され、telephone_field は数字入力フォームが表示されるから。

   [メール入力ボックス](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E3%83%A1%E3%83%BC%E3%83%AB%E5%85%A5%E5%8A%9B%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9)

1. select メソッドの html_opts に multiple: true 記述する

   [html_opts に multiple パラメータをセット](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#html_opts%E3%81%ABmultiple%E3%83%91%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF%E3%82%92%E3%82%BB%E3%83%83%E3%83%88)

1. grouped_collection_select メソッドまたは option_group_from_collection_for_select

   [選択ボックスの選択肢をグループ化する grouped_collection_select メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E9%81%B8%E6%8A%9E%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B-grouped_collection_select%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)

1. fields_for メソッド

   [form_for ブロックの中で異なるモデルを編集する-fields_for メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E9%81%B8%E6%8A%9E%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B-grouped_collection_select%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)

1. truncate メソッド

   [文字列を指定桁で切り捨てる truncate メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E6%96%87%E5%AD%97%E5%88%97%E3%82%92%E6%8C%87%E5%AE%9A%E6%A1%81%E3%81%A7%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E3%82%8B-truncate-%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)

1. sanitize メソッド

   [文字列から要素を除去する sanitize メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E6%96%87%E5%AD%97%E5%88%97%E3%81%8B%E3%82%89%E8%A6%81%E7%B4%A0%E3%82%92%E9%99%A4%E5%8E%BB%E3%81%99%E3%82%8B-sanitize-%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)

1. <%= number_to_currency(12345, unit: '円', precision: 0, format: '%n%u') %>

   [数値を様々な形式で加工する number_xxxx メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E6%95%B0%E5%80%A4%E3%82%92%E6%A7%98%E3%80%85%E3%81%AA%E5%BD%A2%E5%BC%8F%E3%81%A7%E5%8A%A0%E5%B7%A5%E3%81%99%E3%82%8B-number_xxxx-%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)

1. <%= content_tag :p, '今日もいい天気', id: :exam, class: :body %>

   [本体を持つ任意の要素を生成する content_tag メソッド](https://qiita.com/nyan_tech_24/private/17466a7433ed0a314876#%E6%9C%AC%E4%BD%93%E3%82%92%E6%8C%81%E3%81%A4%E4%BB%BB%E6%84%8F%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%94%9F%E6%88%90%E3%81%99%E3%82%8B-content_tag-%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)
