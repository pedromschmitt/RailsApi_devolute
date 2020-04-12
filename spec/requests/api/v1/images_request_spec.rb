require 'rails_helper'

RSpec.describe "Api::V1::Images", type: :request do
  ###Index tests
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

  ##Show tests

  describe 'GET /api/v1/images/:id' do
    context 'Unauthenticated' do
      it_behaves_like :deny_without_authorization, :put, '/api/v1/users/-1'
    end

    context 'Authenticated' do
      let(:user) { create(:user) }

      context 'when image exists' do
        let(:user) { create(:user) }
  
        context 'show image' do
          let(:image) { create(:image) }
  
          before do
            get "/api/v1/images/#{image.id}",  headers: header_with_authentication(user)
          end
  
          it { expect(response).to have_http_status(:success) }
  
          it 'returns valid image in json' do
            expect(json).to eql(serialized(Api::V1::ImageSerializer, image))
          end
        end
  
        context 'when image dont exist' do
          let(:image_id) { -1 }
          
          before do
            get "/api/v1/images/#{image_id}", headers: header_with_authentication(user)
          end
          
          it { expect(response).to have_http_status(:not_found) }
        end
      end
    end
  end

  ### Create Image

  describe 'POST /api/v1/images' do
    context 'Unauthenticated' do
      it_behaves_like :deny_without_authorization, :put, '/api/v1/users/-1'
    end
 
    context 'Authenticated' do
      let(:user) { create(:user) }
 
      context 'Valid params' do
        let(:image_params) { attributes_for(:image) }

        it 'return created' do
          post '/api/v1/images/', params: { image: image_params }, headers: header_with_authentication(user)
          expect(response).to have_http_status(:created)
        end

        it 'returns right image in json' do
          post '/api/v1/images/', params: { image: image_params }, headers: header_with_authentication(user)
          expect(json).to include_json(image_params)
        end

        it 'create image' do
          expect do
            post '/api/v1/images/', params: { image: image_params }, headers: header_with_authentication(user)
          end.to change { Image.count }.by(1)
        end
      end
 
      context 'Invalid params' do
        let(:image_params) { {foo: :bar} }
 
        before { post '/api/v1/images/', params: { image: image_params }, headers: header_with_authentication(user) }
 
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
