require_relative './fetch_item_from_stock'

module Shop
  class DeleteItemFromWarehouse
    def initialize(params)
      @product_id = params.fetch(:product_id).to_i
    end

    def call
      item = FetchItemFromStock.new.call(@product_id, WAREHOUSE)

      return unless item

      reduce_stock_quantity(item)
    end

    private

    def reduce_stock_quantity
      if item.quantity >1
        warehouse_item.quantity -= 1
      else
        WAREHOUSE.delete(item)
      end
    end
  end
end
