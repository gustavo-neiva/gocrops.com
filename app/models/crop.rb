class Crop < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :harvests, dependent: :destroy

  validates :user_id, uniqueness: { scope: :product_id }
  validates :description, presence: :true

  accepts_nested_attributes_for :harvests, reject_if: :all_blank, allow_destroy: true

  mount_uploader :pictures, PictureUploader

end
