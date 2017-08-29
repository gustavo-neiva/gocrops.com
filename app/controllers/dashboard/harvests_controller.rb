class Dashboard::HarvestsController < ApplicationController
    layout "dashboard"

    before_action :set_harvest, only: [:edit, :update, :show, :destroy]
    before_action :active_navbar, only: [:edit, :new, :show]

    def new
      @harvest = Harvest.new
      @crop = current_user.crop
    end

    def create
      @harvest = current_user.crops.build(crop_params)
      if @harvest.save
        redirect_to dashboard_harvests_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @harvest.update(harvest_params)
        redirect_to dashboard_harvests_path
      else
        render :new
      end
    end

    def show
    end

    def destroy
      @harvest.destroy
      redirect_to dashboard_harvests_path
    end

    private

    def active_navbar
      @harvest_class = "navbar-dashboard-link__active"
    end

    def set_crop
      @harvest = Harvest.find(params[:id])
    end

    def harvest_params
      params.require(:harvest).permit(:date, :quantity)
    end
  end
end
