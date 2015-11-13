class DrumTypesController < ApplicationController
  before_action :set_drum_type, only: [:show, :edit, :update, :destroy]

  # GET /drum_types
  # GET /drum_types.json
  def index
    @drum_types = DrumType.all
  end

  # GET /drum_types/1
  # GET /drum_types/1.json
  def show
  end

  # GET /drum_types/new
  def new
    @drum_type = DrumType.new
  end

  # GET /drum_types/1/edit
  def edit
  end

  # POST /drum_types
  # POST /drum_types.json
  def create
    @drum_type = DrumType.new(drum_type_params)

    respond_to do |format|
      if @drum_type.save
        format.html { redirect_to @drum_type, notice: 'Drum type was successfully created.' }
        format.json { render :show, status: :created, location: @drum_type }
      else
        format.html { render :new }
        format.json { render json: @drum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drum_types/1
  # PATCH/PUT /drum_types/1.json
  def update
    respond_to do |format|
      if @drum_type.update(drum_type_params)
        format.html { redirect_to @drum_type, notice: 'Drum type was successfully updated.' }
        format.json { render :show, status: :ok, location: @drum_type }
      else
        format.html { render :edit }
        format.json { render json: @drum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drum_types/1
  # DELETE /drum_types/1.json
  def destroy
    @drum_type.destroy
    respond_to do |format|
      format.html { redirect_to drum_types_url, notice: 'Drum type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drum_type
      @drum_type = DrumType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drum_type_params
      params.require(:drum_type).permit(:diameter, :width, :description, :empty_grams)
    end
end
