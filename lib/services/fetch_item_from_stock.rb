module Shop
  class FetchItemFromStock
    def call(id, stock)
      stock.find do |item|
        item.product_id == id.to_i
      end
    end
  end
end
