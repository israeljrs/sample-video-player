require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do

  describe "GET /dashbord" do
    it "returns http success" do
      get "/admin/sessions/dashbord"
      expect(response).to have_http_status(:success)
    end
  end

end
