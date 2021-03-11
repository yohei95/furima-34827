class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status
end

  #空の投稿を保存できないようにする
  validates :name, :text, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :fee_id,:prefecture_id,:day_id, numericality: { other_than: 1 } 
