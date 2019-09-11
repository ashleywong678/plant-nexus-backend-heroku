class Api::V1::PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET users/:user_id/plants
  def index
    if @plants = User.find_by(id: params[:user_id]).plants
      render json: PlantSerializer.new(@plants)
    else
      render json: {
        error: "Sorry, there was an error. No plants found"
      }
    end
  end

  # GET users/:user_id/plants/1
  def show
    render json: PlantSerializer.new(@plants)
  end

  #POST /plants
  def create
    @plant = current_user.plants.build(plant_params)
    if @plant.save
      render json: PlantSerializer.new(@plant), status: :created
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  #PATCH/PUT /plants/1
  def update
    if current_user == @plant.user && @plant.update(plant_params)
      render json: PlantSerializer.new(@plant), status: :ok
    else
      error_resp = {
        error: @plant.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  #DELETE /plants/1
  def destroy
    if @plant.destroy
      render json: {data: "Successfully removed this dead plant"}, status: :ok
    else
      errors_resp = {
        error: "The force is with this plant, it still lives!"
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :scientific_name, :image_url, :notes)
  end

end
