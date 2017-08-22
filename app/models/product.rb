class Product < ApplicationRecord
  belongs_to :category
  has_many :crops
  has_many :price_informations

  validates :name, :category_id, presence: true, uniqueness: true
  validates :amount, presence: true
end
