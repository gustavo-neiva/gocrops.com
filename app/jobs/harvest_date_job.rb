class HarvestDateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Harvest.where(date: Date.today).each do |harvest|
      harvest.crop.update(production: harvest.crop.production + harvest.quantity) 
    end
  end
end
