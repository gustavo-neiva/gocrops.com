class Api::V1::CropsController < Api::V1::BaseController
  def index
    @crops = Crop.all

    if params[:latitude].present? && params[:longitude].present?
      users = User.near(
        [params[:latitude], params[:longitude]],
        params[:distance] || 200,
        unit: :km
      )
      @crops = @crops.joins(:user).merge(users).select("crops.*")
    end
  end
end
