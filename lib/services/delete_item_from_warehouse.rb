module Shop
  class DeleteItemFromWarehouse
    def call(item_id)
      warehouse_item = FetchWarehouseItem.new.call(item_id)

      return unless warehouse_item

      reduce_warehouse_quantity(warehouse_item)
    end

    private
    def reduce_warehouse_quantity
      if warehouse_item.quantity >1
        warehouse_item.quantity -= 1
      else
        WAREHOUSE.delete(warehouse_item)
      end
    end
  end
end
