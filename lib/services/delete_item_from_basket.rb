require_relative './fetch_item_from_stock'

module Shop
  class DeleteItemFromBasket
    def initialize(params)
      @product_id = params.fetch(:product_id)
    end

    def call
      item = FetchItemFromStock.new.call(@product_id, BASKET)

      return unless item

      reduce_stock_quantity(item)
    end

    private

    def reduce_stock_quantity
      if item.quantity >1
        item.quantity -= 1
      else
        BASKET.delete(item)
      end
    end
  end
end
