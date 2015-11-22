class WizardController < ApplicationController
  def cable
    @cables = CableType.all.order(:sku, :description)
  end

  def drum
    if !params[:wizard] then
      redirect_to wizard_cable_path, flash: { notice: "You must pick a cable type." }
    end
      
    @drums = DrumType.all.order(:diameter, :width, :description)
    @query = params[:wizard]
  end

  def weight
    if !params[:wizard] then
      redirect_to wizard_cable_path, flash: { notice: "Something went wrong, and so you have to start again. Have a nice user experience!" }
    end
          
    @query = params[:wizard]
  end

  def result
    @query = params[:wizard]
    @cable                   = CableType.find(@query["cable_type"])
    @cable_grams_per_metre  = CableType.find(@query["cable_type"]).grams_per_metre.to_i
    @empty_drum_grams       = DrumType.find(@query["drum_type"]).empty_grams.to_i
    @measured_grams         = @query["measured_kg"].to_f * 1000
    scale_increment        = 200.0
    
    @approx_metres         = ((@measured_grams - @empty_drum_grams) / @cable_grams_per_metre).round
    @margin_of_error       = (scale_increment / @cable_grams_per_metre).ceil
    
    if (@approx_metres < 1) then 
      @approx_metres = 0
    end
      
      if (@measured_grams < @empty_drum_grams.to_f) then
        flash[:notice] = "Measured weight was less than the empty drum weight. Are you sure you have selected the correct drum and cable type?"
      end
      
    #TODO: If measured grams is less than drum weight, redirect to weight with a flash error (pass on query)
       
  end

  def label
    @query = params[:wizard]
    @cable = CableType.find(@query["cable_type"])
    @drum  = DrumType.find(@query["drum_type"])
    moe = @query["margin_of_error"].to_i
    am  = @query["approx_metres"].to_i
    @metres_upper = am + moe
    @metres_lower = am - moe
    @today = Date.today.to_s
  end
end
