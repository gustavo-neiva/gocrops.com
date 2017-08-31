class Api::V1::CropsController < Api::V1::BaseController
  def index
    @crops = Crop.all
  end
end
