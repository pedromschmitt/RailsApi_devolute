module Api
  module V1
    class ImageSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers

      attributes :id, :title, :image_url

      def image_url
        rails_blob_path(object.image, disposition: "attachment", only_path: true) if object.image.attached?
      end

    end
  end
end
