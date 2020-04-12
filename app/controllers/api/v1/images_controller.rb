module Api
  module V1
    class ImagesController < Api::V1::ApiController
      before_action :authenticate_user
      before_action :set_image, except: %i[create index]


      def index
        user = User.find params[:user_id]
        @images = user.images
        render json: @images
      end

      def show
        render json: @image

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

      def set_image
        @image = Image.find(params[:id])
      end

    end
  end
end
