module Shop
  class Item
    attr_reader :id, :quantity
    attr_accessor :product_id

    @@id = 0

    def initialize(product_id:, quantity:)
      @id = set_id
      @product_id = product_id
      @quantity = quantity
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def total_net_price
      product = fetch_product
      product.price * quantity
    end

    def total_gros_price
      product = fetch_product
      product.price * quantity * 1.23
    end

    private

    def set_id
      @@id +=1
    end
  end
end
