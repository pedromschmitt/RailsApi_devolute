module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :authenticate_user, only: %i[current update]
      before_action :set_user, only: %i[show update]

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
      end

      def current
        render json: current_user
      end

      def show
        render json: @user
      end

      private 

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
