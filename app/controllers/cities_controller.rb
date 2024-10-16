class CitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @dog_sightings = @city.dog_sightings # assuming you have a has_many association set up
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user

    if @city.save
      redirect_to cities_path, notice: 'City was successfully created.'
    else
      flash.now[:alert] = @city.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return unless current_user.id != @city.user_id

    redirect_to cities_url, notice: 'You are not allowed to edit'
  end

  def update
    if @city.update(city_params)
      redirect_to city_url(@city), notice: 'City was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @city.user == current_user || current_user.admin?
      @city.destroy
      redirect_to cities_path, notice: 'City was successfully deleted.'
    else
      redirect_to cities_path, alert: 'You are not authorized to delete this city.'
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:city_name)
  end
end
