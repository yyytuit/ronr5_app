class Book < ApplicationRecord
  # 型変換
  # attribute :price, :float

  # アソシエーション
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :authors
  has_many :users, through: :reviews
  has_many :memos, as: :memoable

  # スコープ
  scope :gihyo, -> { where(publish: '技術評論社')}
  scope :newer, -> { order(publish: :desc)}
  scope :top10, -> { newer.limit(10)}
  scope :whats_new, -> (pub) {where(publish: pub).order(published: :desc).limit(5)}

  # バリデーション
  validates :isbn,      presence: { message: 'は必須です'},
                        uniqueness: { allow_blank: true, message: '%{value}は一意でなければなりません' },
                        length: { is: 17, allow_blank: true, message: '%{value}は%{count}桁でなければなりません' }
                        # format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/, allow_blank: true, message: '%{value}は正しい形式でなければなりません' }
                        # isbn: { allow_old: true }
  validates :title,     presence: true,
                        length: { minimum: 1, maximum: 100 },
                        uniqueness: { scope: :publish}
  validates :price,     numericality: { only_integer: true, less_than: 1000}
  validates :publish,   inclusion: { in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム']}
  validate :isbn_valid?

  #コールバックメソッド
  # after_destroy :history_book

  # 条件付きでコールバックを適用
#  after_destroy :history_book,
#  unless: Proc.new { |b| b.publish == "unknown" }

 # コールバックメソッドをブロック形式で定義
  # after_destroy do |b|
  #   logger.info('deleted: ' + b.inspect)
  # end

  after_destroy BookCallbacks.new

  private
    def history_book
      logger.info('deleted: ' + self.inspect)
    end
    def isbn_valid?
      errors.add(attribute, 'は正しい形式ではありません。') unless isbn =~ /\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
    end
end
