module Shop
  class FetchBasket
    def call
      BASKET.map do |b|
        {
          product: b.fetch_product,
          quantity: b.quantity,
          total_net_price: b.total_net_price,
          total_gros_price: b.total_gros_price
        }
      end
    end
  end
end
