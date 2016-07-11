module Shop
  class FetchBasket
    def call
      BASKET.map do |b|
        {
          product: b.fetch_product,
          quantity: b.quantity,
          total_price: b.total_price
        }
      end
    end
  end
end