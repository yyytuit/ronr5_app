class Book < ApplicationRecord
  has_many :review, dependent: :destroy

  # スコープ
  scope :gihyo, -> { where(publish: '技術評論社')}
  scope :newer, -> { order(publish: :desc)}
  scope :top10, -> { newer.limit(10)}
  scope :whats_new, -> (pub) {where(publish: pub).order(published: :desc).limit(5)}
end
