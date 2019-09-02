class Api::V1::PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET users/:user_id/plants
  def index
    if @plants = User.find_by(id: params[:user_id]).plants
      render json: @plants
    else
      render json: {
        error: "Sorry, there was an error. No plants found"
      }
    end
  end

  # GET users/:user_id/plants/1
  def show
    render json: @plant
  end

  #POST /plants
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
      render json: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  #DELETE /plants/1
  def destroy
    @plant.destroy
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def user_params
    params.require(:plant).permit(:name, :scientific_name, :image_url)
  end

end
