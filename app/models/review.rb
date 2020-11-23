class Review < ApplicationRecord
  belongs_to :book
  # カウンターキャッシュを有効化
  belongs_to :user, counter_cache: true

  # enum型
  enum status: { draft:0, published:1, deleted:2 }

  # スコープ
  default_scope { order(updated_at: :desc) }
end
