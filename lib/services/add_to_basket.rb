module Shop
  class AddToBasket
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      BASKET << Basket.new(
        product_id: @product_id,
        quantity: @quantity
        )
    end
  end
end