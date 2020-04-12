module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :photo

    end
  end
end
