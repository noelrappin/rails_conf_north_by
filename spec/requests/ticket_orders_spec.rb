require "rails_helper"

RSpec.describe "TicketOrders", type: :request do
  describe "GET /ticket_orders" do
    it "works! (now write some real specs)" do
      get ticket_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
