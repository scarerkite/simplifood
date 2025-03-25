require "rails_helper"

RSpec.describe "Home", type: :request do
  describe "GET /home" do
    it "returns a successful response" do
      get "/home"
      expect(response).to have_http_status(:success)
    end

    it "returns HTML content" do
      get "/home"
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    it "includes React mounting point" do
      get "/home"
      expect(response.body).to include('<div id="root">')
    end
  end
end
