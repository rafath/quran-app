require 'rails_helper'

RSpec.describe "Ayets", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/ayets/show"
      expect(response).to have_http_status(:success)
    end
  end

end
