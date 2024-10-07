class DogSightingsController < ApplicationController
  def index
    @dog_sightings = DogSighting.all
  end

  def show
    @dog_sighting = DogSighting.find(params[:id])
  end

  def new
    @dog_sighting = DogSighting.new
  end

  def create
    @dog_sighting = DogSighting.new(dog_sighting_params)

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
    @dog_sighting = DogSighting.find(params[:id])
  end

  def update
    @dog_sighting = DogSighting.find(params[:id])
    if @dog_sighting.update(dog_sighting_params)
      redirect_to @dog_sighting, notice: 'Dog sighting was succesfully updated'
    else
      render :edit
    end
  end

  def destroy
    @dog_sighting = DogSighting.find(params[:id])
    @dog_sighting.destroy
    redirect_to dog_sightings_url, notice: 'Dog sighting was succesfully deleted'
  end

  private

  def dog_sighting_params
    params.require(:dog_sighting).permit(:dog_description, :location, :city_id, :user_id)
  end
end
