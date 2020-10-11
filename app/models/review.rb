class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # enum型
  enum status: { draft:0, published:1, deleted:2 }

  # スコープ
  default_scope { order(updated_at: :desc) }
end
