module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :photo, :images_count

      def images_count
        object.images.count
      end
    end
  end
end
