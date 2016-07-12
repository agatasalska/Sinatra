module Shop
  class FetchWarehouse
    def call(id)
      WAREHOUSE.find do |warehouse|
        warehouse.id == id
      end
    end
  end
end
