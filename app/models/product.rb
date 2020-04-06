class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :estimated_delivery_date
  belongs_to_active_hash :size
  belongs_to_active_hash :estimated_delivery_date
  belongs_to_active_hash :products_status
  belongs_to_active_hash :shipping_charges

  belongs_to :seller, class_name: "User"
  has_many :images, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :size_id, :products_status_id, :shipping_charges_id, :shipping_method_id,
             :delivery_area_id, :estimated_delivery_date_id,                      presence: true
  validates :text, length: { in: 1..1000 }
  validates :selling_price, numericality: {  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :images, presence: true

end