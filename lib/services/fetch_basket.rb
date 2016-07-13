module Shop
  class FetchBasket
    def call
      BASKET.map do |basket_item|
        {
          product: basket_item.fetch_product,
          quantity: basket_item.quantity,
          total_net_price: basket_item.total_net_price,
          total_gros_price: basket_item.total_gros_price
        }
      end
    end
  end
end
