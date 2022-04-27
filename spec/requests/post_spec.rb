require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/index/posts/" do
    it "response status is correct" do
      get "/users/index/posts/"
      expect(response).to have_http_status(:success)
    end

		it "renderes correct template" do
			get "/users/index/posts/"
			expect(response).to render_template("posts/index")
		end

		it "includes correct placeholder text" do
			get "/users/index/posts/"
			expect(response.body).to include('Posts')
			expect(response.body).to include('List of posts')
		end
  end

	describe "GET /users/index/posts/show" do
    it "response status is correct" do
      get "/users/index/posts/show"
      expect(response).to have_http_status(:success)
    end

		it "renderes correct template" do
			get "/users/show/posts/show/"
			expect(response).to render_template("posts/show/")
		end

		it "includes correct placeholder text" do
			get "/users/index/posts/show/"
			expect(response.body).to include('Show posts')
			expect(response.body).to include('Post details')
		end
  end
end
