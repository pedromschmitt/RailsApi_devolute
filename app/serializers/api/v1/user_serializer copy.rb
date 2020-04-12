module Api
  module V1
    class ImageSerializer < ActiveModel::Serializer
      attributes :id, :title, :image_thumbnail

      def image_thumbnail
        variant = object.image.variant(resize: "100x100")
        return rails_representation_url(variant, only_path: true)
      end

    end
  end
end
