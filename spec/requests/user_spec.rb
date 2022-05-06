require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'http request' do
    before(:example) { get "/users" }

    it 'response status is correct' do
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      expect(response).to render_template('index')
    end
  end
end

