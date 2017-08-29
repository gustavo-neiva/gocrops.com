class Sell < ApplicationRecord
  belongs_to :crop

  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true
  before_create :update_crop_production!, if: :quantity_changed?

  def update_crop_production!
    self.crop.update(production: crop.production - quantity)
  end

end
