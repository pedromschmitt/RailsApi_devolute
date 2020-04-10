module Api
  module V1
    class ApiController < AplicationController
      include Knock::Authenticable
    end
  end
end