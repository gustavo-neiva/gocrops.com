class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: true, presence: true
  validates :category_id, presence: true
end
