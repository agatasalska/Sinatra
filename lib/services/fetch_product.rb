module Shop
  class FetchProduct
    def call(id)
      PRODUCTS.find do |product|
        product.id == id.to_i
      end
    end
  end
end
