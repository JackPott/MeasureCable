class WizardController < ApplicationController
  def cable
    @cables = CableType.all.order(:sku, :description)
  end

  def drum
    @drums = DrumType.all.order(:diameter, :width, :description)
    @query = params[:wizard]
  end

  def weight
    @query = params[:wizard]
  end

  def result
    @query = params[:wizard]
    @cable_grams_per_metre  = CableType.find(@query["cable_type"]).grams_per_metre.to_i
    @empty_drum_grams       = DrumType.find(@query["drum_type"]).empty_grams.to_i
    @measured_grams         = @query["measured_kg"].to_f * 1000
    scale_increment        = 100.0
    
    @approx_metres         = ((@measured_grams - @empty_drum_grams) / @cable_grams_per_metre).round
    @margin_of_error       = (scale_increment / @cable_grams_per_metre).ceil
    
    if (@approx_metres < 1) then 
      @approx_metres = 0
    end
      
    #TODO: If measured grams is less than drum weight, redirect to weight with a flash error (pass on query)
       
  end

  def label
    @query = params[:wizard]
    @cable = CableType.find(@query["cable_type"])
    moe = @query["margin_of_error"].to_i
    am  = @query["approx_metres"].to_i
    @metres_upper = am + moe
    @metres_lower = am - moe
    @today = Date.today.to_s
  end
end
