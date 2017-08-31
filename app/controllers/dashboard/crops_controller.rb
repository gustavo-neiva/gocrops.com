class Dashboard::CropsController < ApplicationController
    layout "dashboard"

    before_action :set_crop, only: [:edit, :update, :show, :destroy]
    before_action :active_navbar, only: [:edit, :new, :show]

    # def index
    #   @crops = current_user.crops
    #   @crops_class = "navbar__dashboard__link--active"
    # end


    def create
      @crop = current_user.crops.build(crop_params)
      if @crop.save
        flash[:notice] = "Crop successfully created"
        redirect_to dashboard_crops_path
      else
        flash[:alert] = "Please try again and fill all required fields!"
        redirect_to dashboard_crops_path
      end
    end

    def edit
    end

    def update
      if @crop.update(crop_params)
        flash[:notice] = "Crop successfully updated!"
        redirect_to dashboard_crop_path(@crop)
      else
        flash[:alert] = "Please try again and fill all required fields!"
        p @crop.errors
        redirect_to dashboard_crop_path(@crop)
      end
    end

    def show
    end

    def destroy
      @crop.destroy
      redirect_to dashboard_crops_path
    end

    private

    def active_navbar
      @crops_class = "navbar__dashboard__link--active"
    end

    def set_crop
      @crop = Crop.find(params[:id])
    end

    def crop_params
      params.require(:crop).permit(:harvest_date, :transport, :product_id, :pictures, :description, harvests_attributes: [:id, :date, :quantity, :_destroy])
    end
  end
