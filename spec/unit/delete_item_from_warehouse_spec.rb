require './lib/services/delete_item_from_warehouse'
require './shop'

RSpec.describe Shop::DeleteItemFromWarehouse do
  let(:params) { { product_id: 1 } }
  subject(:warehouse) { Shop::DeleteItemFromWarehouse.new(params) }

  before do
    allow(Shop).to receive(:WAREHOUSE).and_return([])
    Shop::WAREHOUSE.clear
  end

  describe "#call" do
    context "invalid id" do
      it "raises no error" do
        expect {
          warehouse.call
        }.not_to raise_error
      end
    end

    context "valid id" do
      let(:quantity) { 5 }
      let!(:add_item_to_warehouse) { Shop::WAREHOUSE << Shop::Item.new(product_id: 1, quantity: quantity) }
      let(:first_warehouse) {Shop::WAREHOUSE.first}

      it "deletes item" do
        expect {
          warehouse.call(first_warehouse.quantity).to change(quantity).to(quantity-1)
        }
      end
    end
  end
end
