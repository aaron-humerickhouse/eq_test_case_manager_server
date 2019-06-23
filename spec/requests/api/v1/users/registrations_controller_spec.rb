require 'rails_helper'

describe 'signup', type: :request do
  let(:url) { '/api/v1/users/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      friendly_response = JSON.parse(response.body, symbolize_names: true)
      expect(friendly_response[:first_name]).to eq params[:user][:first_name]
      expect(friendly_response[:last_name]).to eq params[:user][:last_name]
      expect(friendly_response[:email]).to eq params[:user][:email]
    end
  end

  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      friendly_response = JSON.parse(response.body, symbolize_names: true)
      expect(friendly_response[:errors][:email].first).to eq('has already been taken')
    end
  end
end
