class CropsController < ApplicationController

    before_action :set_user, only: [:edit, :update, :show, :destroy]

    def index
      @crops = Crop.all
    end

    def new
      @crop = Crop.new
    end

    def create
      @crop = current_user.crops.build(crop_params)
      if @crop.save
        redirect_to dashboard_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @crop.update(crop_params)
        redirect_to dashboard_path
      else
        render :new
      end
    end

    def show
    end

    def destroy
      @crop.destroy
      redirect_to dashboard_path
    end

    private

    def set_crop
      @crop = Crop.find(params[:id])
    end

    def crop_params
      params.require(:crop).permit(:harvest_date, :production, :transport, :product_id)
    end
  end

end
