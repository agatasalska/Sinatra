module Shop
  class Basket
    attr_reader :id, :products 

    @@id = 0

    def initialize(id)
      @id = id
      @products = []
    end
  end
end