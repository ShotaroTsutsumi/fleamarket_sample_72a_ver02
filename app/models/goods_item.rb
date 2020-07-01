class GoodsItem < ApplicationRecord
  validates  :name,:province, :explanation, :category, :condition, :shipping_fee, :category, :delivery_way_id, :delivery_date, :selling_price, presence: true
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  # has_one :order, dependent: :destroy
  

  # has_many :images
  # モデルimage.rbにバリデーションをかける
  validates_associated :images
  validates :images, presence: true
  # fields_forメソッドを利用するために、imageモデルを小モデルとする
  accepts_nested_attributes_for :images, allow_destroy: true
  # has_one :order, dependent: :destroy

  # active_hashによるリレーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_way
  



end
