require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admin/index"
      expect(response).to have_http_status(:redirect)
    end
  end

end
