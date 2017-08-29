class Harvest < ApplicationRecord
  belongs_to :crop

  validates :crop_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true

end
