require "web_helper"

RSpec.describe "POST /basket", type: :request do
  context "with invalid params" do
    let(:invalid_params) { { test: "something" } }

    before do
      do_request(invalid_params)
    end

    it "returns 404 as HTTP status code" do
      expect(last_response.status).to eql(404)
    end
  end

  context "with valid params" do
    context "product not in the warehouse" do
      let(:product) { Shop::FetchBasketItemList.new.call.first }
      let(:valid_params) { { "product_id" => product.id, "quantity" => "1" } }

      before do
        do_request(valid_params)
      end

      it "returns 404 as HTTP status code" do
        expect(last_response.status).to eql(404)
      end
    end
  end

  private

  def do_request(params = {})
    post "/basket/add", params
  end
end
