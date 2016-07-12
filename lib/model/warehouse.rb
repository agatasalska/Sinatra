module Shop
  class Warehouse
    attr_reader :id, :product_id
    attr_accessor :quantity

    def initialize(product_id, quantity)
      @id = id
      @product_id = product_id
      @quantity = quantity
    end
  end
end
