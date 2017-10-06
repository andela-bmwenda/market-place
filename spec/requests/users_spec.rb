require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_id) { user.id }

  describe "POST /signup" do
    context 'when request is valid' do
      before { post '/signup', params: attributes_for(:user) }

      it 'returns a 201 status code' do
        expect(response).to have_http_status(201)
      end

      it 'creates a user' do
        expect(json['email']).not_to eq(user.email)
      end
    end

    context 'when request is invalid' do
      before { post '/signup', params: attributes_for(:user, email: nil) }

      it 'returns a 422 status code' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
