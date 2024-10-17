class CommentsController < ApplicationController
  before_action :set_dog_sighting

  def create
    @comment = @dog_sighting.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @dog_sighting, notice: 'Comment was successfully added.'
    else
      render 'dog_sightings/show'
    end
  end

  private

  def set_dog_sighting
    @dog_sighting = DogSighting.find(params[:dog_sighting_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
