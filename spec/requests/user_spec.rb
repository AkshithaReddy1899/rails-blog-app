require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/index" do
    it "response status is correct" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end

		it "renderes correct template" do
			get "/users/"
			expect(response).to render_template("users/index")
		end

		it "includes correct placeholder text" do
			get "/users/"
			expect(response.body).to include('Users')
			expect(response.body).to include('List of users')
		end
  end

	describe "GET /users/show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end

		it "renderes correct template" do
			get "/users/show"
			expect(response).to render_template("users/show")
		end

		it "includes correct placeholder text" do
			get "/users/show"
			expect(response.body).to include('Show users')
			expect(response.body).to include('User details')
		end
  end

end
