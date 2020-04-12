class Api::V1::ImagesController < ApplicationController


  def index
    user = User.find params[:user_id]
    @images = user.images
    render json: @images
  end

  def show
  end

  def create
    @image = Image.new(image_params.merge(user: current_user))
 
    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :image)
  end

end
