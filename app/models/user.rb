class User < ApplicationRecord
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews
  # findするたびに以下のコードによってレコードが作られてしまう???
  # validates :agreement, acceptance: { on: create}
  validates :email, confirmation: true, presence: { if: proc { |d| d.dm.blank? } }
end
