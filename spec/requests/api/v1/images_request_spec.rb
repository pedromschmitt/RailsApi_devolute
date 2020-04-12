require 'rails_helper'

RSpec.describe "Api::V1::Images", type: :request do
  describe 'GET /api/v1/images?user_id=:id' do
    context 'User exists' do
      let(:user) { create(:user) }
      let(:images_number) { Random.rand(1..5) }

      before { images_number.times { create(:image, user: user) } }

      it do
        get "/api/v1/images?user_id=#{user.id}", headers: header_with_authentication(user)
        expect(response).to have_http_status(:success)
      end

      it 'returns right images' do
        get "/api/v1/images?user_id=#{user.id}", headers: header_with_authentication(user)
        expect(json).to eql(each_serialized(Api::V1::ImageSerializer, user.images))
      end
    
  end

    context 'User dont exist' do
      let(:user) { create(:user) }
      let(:user_id) { -1 }

      before { get "/api/v1/images?user_id=#{user_id}", headers: header_with_authentication(user) }

      it { expect(response).to have_http_status(:not_found) }
    end
  end
end
