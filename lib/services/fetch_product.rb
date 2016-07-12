module Shop
  class FetchProduct
    def call(id)
      PRODUCTS.find do |product|
        product.id == id
      end
    end
  end
end
