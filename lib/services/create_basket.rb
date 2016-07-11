module Shop
  class CreateBasket
    def call(id)
      BASKET << Basket.new(id)
    end
  end
end