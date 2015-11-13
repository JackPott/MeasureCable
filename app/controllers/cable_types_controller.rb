class CableTypesController < ApplicationController
  before_action :set_cable_type, only: [:show, :edit, :update, :destroy]

  # GET /cable_types
  # GET /cable_types.json
  def index
    @cable_types = CableType.all.order(:sku, :description)
  end

  # GET /cable_types/1
  # GET /cable_types/1.json
  def show
  end

  # GET /cable_types/new
  def new
    @cable_type = CableType.new
  end

  # GET /cable_types/1/edit
  def edit
  end

  # POST /cable_types
  # POST /cable_types.json
  def create
    @cable_type = CableType.new(cable_type_params)

    respond_to do |format|
      if @cable_type.save
        format.html { redirect_to @cable_type, notice: 'Cable type was successfully created.' }
        format.json { render :show, status: :created, location: @cable_type }
      else
        format.html { render :new }
        format.json { render json: @cable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cable_types/1
  # PATCH/PUT /cable_types/1.json
  def update
    respond_to do |format|
      if @cable_type.update(cable_type_params)
        format.html { redirect_to @cable_type, notice: 'Cable type was successfully updated.' }
        format.json { render :show, status: :ok, location: @cable_type }
      else
        format.html { render :edit }
        format.json { render json: @cable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cable_types/1
  # DELETE /cable_types/1.json
  def destroy
    @cable_type.destroy
    respond_to do |format|
      format.html { redirect_to cable_types_url, notice: 'Cable type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cable_type
      @cable_type = CableType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cable_type_params
      params.require(:cable_type).permit(:sku, :description, :grams_per_metre)
    end
end
