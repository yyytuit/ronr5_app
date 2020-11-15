class User < ApplicationRecord
  has_one :author
  validates :agreement, acceptance: { on: create}
  validates :email, confirmation: true
end
