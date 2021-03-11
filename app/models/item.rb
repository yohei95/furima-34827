class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image
end

with_options presence: true do
  validates :name
  validates :text
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
  end
end
