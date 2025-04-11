class DogSightingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_dog_sighting, only: %i[edit update destroy]
  before_action :authorize_user!, only: %i[edit update]
  before_action :set_cities, only: [:index]

  def index
    @cities = City.all
    @dog_sightings = if params[:city_id].present?
                       DogSighting.where(city_id: params[:city_id])
                     else
                       DogSighting.all
                     end
  end

  def show
    @dog_sighting = DogSighting.find(params[:id])
    @comment = Comment.new
  end

  def new
    @dog_sighting = DogSighting.new
  end

  def create
    @dog_sighting = DogSighting.new(dog_sighting_params)
    @dog_sighting.user = current_user

    respond_to do |format|
      if @dog_sighting.save
        format.html { redirect_to dog_sighting_url(@dog_sighting), notice: 'Dog Sighting was successfully created.' }
        format.json { render :show, status: :created, location: @dog_sighting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog_sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # Authorization is handled by the `authorize_user!` before_action
  end

  def update
    if @dog_sighting.update(dog_sighting_params)
      redirect_to @dog_sighting, notice: 'Dog sighting was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @dog_sighting.user == current_user
      if @dog_sighting.destroy
        redirect_to dog_sightings_path, notice: 'Dog sighting was successfully deleted.'
      else
        redirect_to dog_sightings_path, alert: 'Failed to delete the dog sighting. Please try again.'
      end
    else
      redirect_to dog_sightings_path, alert: 'You are not authorized to delete this sighting.'
    end
  end

  # def destroy
  #   if @dog_sighting.user == current_user
  #     @dog_sighting.destroy
  #     redirect_to dog_sightings_path, notice: 'Dog sighting was successfully deleted.'
  #   else
  #     redirect_to dog_sightings_path, alert: 'You are not authorized to delete this sighting.'
  #   end
  # end

  def create_comment
    @comment = @dog_sighting.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @dog_sighting, notice: 'Comment was successfully added.'
    else
      render :show
    end
  end

  private

  def dog_sighting_params
    params.require(:dog_sighting).permit(:dog_description, :location, :city_id, :user_id)
  end

  def set_dog_sighting
    @dog_sighting = DogSighting.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  # Check if the current user is authorized to edit or update the dog sighting
  # def authorize_user!
  #   return if @dog_sighting.user == current_user

  #   redirect_to dog_sightings_path, alert: 'You are not authorized to edit this dog sighting.'
  # end

  def authorize_user!
    return if @dog_sighting.user == current_user

    redirect_to dog_sightings_path, alert: 'You are not authorized to perform this action.'
  end

  def set_cities
    @cities = City.all
  end
end
