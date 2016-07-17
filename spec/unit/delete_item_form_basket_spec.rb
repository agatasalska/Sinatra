require './lib/services/delete_item_from_basket'
require './shop'

RSpec.describe Shop::DeleteItemFromBasket do
  let(:params) { { product_id: 1 } }
  subject(:basket) { Shop::DeleteItemFromBasket.new(params) }

  before do
    allow(Shop).to receive(:BASKET).and_return([])
    Shop::BASKET.clear
  end

  describe "#call" do
    context "invalid id" do
      it "raises no error" do
        expect {
          basket.call
        }.not_to raise_error
      end
    end

    context "valid id" do
      let(:quantity) { 5 }
      let!(:add_item_to_basket) { Shop::BASKET << Shop::Item.new(product_id: 1, quantity: quantity) }
      let(:first_basket) {Shop::BASKET.first}

      it "deletes item" do
        expect {
          basket.call(first_basket.quantity).to change(quantity).to(quantity-1)
        }
      end
    end
  end
end
