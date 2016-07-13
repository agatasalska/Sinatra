module Shop
  class FetchWarehouseItem
    def call(warehouse_item_id)
      WAREHOUSE.find do |warehouse|
        warehouse.warehouse_item_id == warehouse_item_id.to_i
      end
    end
  end
end
