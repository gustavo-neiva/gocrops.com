class Harvest < ApplicationRecord
  belongs_to :crop
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true
  validate :validate_date_in_present
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

  def validate_date_in_present
    if date.present? && date < Date.today
      errors.add(:date, "Please choose a harvest date that is in the future!")
    end
  end
end
