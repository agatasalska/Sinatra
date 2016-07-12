module Shop
  class Product
    attr_reader :id, :name, :price

    def initialize(name, price)
      @id = id
      @name = name
      @price = price
    end
  end
end
