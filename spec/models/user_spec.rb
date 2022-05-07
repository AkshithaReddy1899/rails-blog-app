require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'http request' do
    before(:example) { get "/users" }

    it 'response status is correct' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    it 'renders correct template' do
      expect(response).to render_template('index')
    end
  end
end