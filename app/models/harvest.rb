class Harvest < ApplicationRecord
  belongs_to :crop, dependent: :destroy
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true
  before_update :update_crop_production!, if: :quantity_changed?

  def update_crop_production!
    if Date.today >= harvest_date
      if quantity > quantity_was
        self.crop.update(production: crop.production + (quantity - quantity_was))
      else
        self.crop.update(production: crop.production - (quantity_was - quantity))
      end
    end
  end

end
