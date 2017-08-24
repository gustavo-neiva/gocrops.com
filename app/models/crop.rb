class Crop < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :user_id, uniqueness: { scope: :product_id }
  validates :production, presence: :true
  validates :description, presence: :true
  validate :validate_date_in_present

  mount_uploader :pictures, PictureUploader

  def validate_date_in_present
    if harvest_date.present? && harvest_date < Date.today
      errors.add(:harvest_date, "Please choose a harvest date date that is in the present!")
    end
  end
end
