class CitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :authorize_user, only: [:destroy]
  before_action :set_city, only: %i[show edit update destroy]
  before_action :ensure_editable, only: %i[edit update destroy]

  def index
    @cities = City.all
  end

  def show
    # @city = City.find(params[:id])
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
    @city = City.find(params[:id])

    if current_user.id != @city.user_id
      redirect_to cities_url, notice: 'You are not allowed to edit'
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to city_url(@city), notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @city.destroy
    # redirect_to cities_path, notice: 'City was successfully deleted.'
    @city = City.find(params[:id])
    if @city.user == current_user # or check for admin role
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

  def ensure_editable
    return if @city.user == current_user

    flash[:alert] = 'You are not allowed to edit or delete this city'
    redirect_to cities_path
  end

  def authorize_user
    redirect_to cities_path, alert: 'Not authorized' unless current_user.admin? # example
  end
end
