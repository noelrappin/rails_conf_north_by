require "rails_helper"

RSpec.describe "Concerts", type: :request do
  describe "GET /concerts" do
    it "works! (now write some real specs)" do
      get concerts_path
      expect(response).to have_http_status(200)
    end
  end
end
