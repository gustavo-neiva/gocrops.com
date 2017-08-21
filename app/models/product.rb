class Product < ApplicationRecord
  belongs_to :category
  has_many :crops

  validates :name, :category_id, presence: true, uniqueness: true
  validates :amount, presence: true
end
