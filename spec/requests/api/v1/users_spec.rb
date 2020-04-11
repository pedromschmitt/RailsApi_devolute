require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users/:id" do
    context 'when user exists' do
      let(:user) {create(:user)}

      before do
        get "/api/v1/users/#{user.id}"
      end

      it { expect(response).to have_http_status(:success)}

      it 'returns valid user in json' do
        expect(json).to eql.(serialized(Api::V1::UserSerializer, user))
      end
    end

    context 'when user dont exist' do
      let(:user_id) { -1 }
      
      before { get "/api/v1/users/#{user.id}" }

      it { expect(response).to have_http_status(:not_found)}
    end
  end

  describe 'GET /api/v1/users/current' do
    context 'Unauthenticated' do
      it_behaves_like :deny_without_authorization, :get, '/api/v1/users/current'
    end

    context 'Authenticated' do
      let(:user) { create(:user) }

      before do
        get '/api/v1/users/current', headers: header_with_authentication(user)
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns valid user in json' do
        expect(json).to eql(serialized(Api::V1::UserSerializer, user))
      end
    end

  end
end
