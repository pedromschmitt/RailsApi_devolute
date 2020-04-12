class Api::V1::ImagesController < ApplicationController


  def index
    user = User.find params[:user_id]
    @images = user.images
    render json: @images
  end

  def show
  end

  def create
  end

end
