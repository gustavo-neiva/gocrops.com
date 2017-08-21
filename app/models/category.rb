class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :unit, presence: true, inclusion: { in: [100 kg] }
end

