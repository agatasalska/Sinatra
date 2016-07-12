module Shop
  class DeleteWarehouse
    def call(id)
      warehouse = FetchWarehouse.new.call(id)

      return unless warehouse

      reduce_warehouse_quantity(warehouse)
    end

    private
    def reduce_warehouse_quantity(warehouse)
      if warehouse.quantity > 1
        warehouse.quantity -= 1
      else
        WAREHOUSE.delete(warehouse)
      end
    end
  end
end
