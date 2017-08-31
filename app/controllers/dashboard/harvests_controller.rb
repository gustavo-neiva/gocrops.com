class Dashboard::HarvestsController < ApplicationController

  def destroy
    @harvest = Harvest.find(params[:id])
    @harvest.destroy
    @quantity = @harvest.crop.harvests.sum(:quantity)
    respond_to do |format|
      format.js
    end
  end

end
