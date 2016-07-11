module Shop
  class FetchBasket
    def call(id)
      BASKET.find do |basket|
        basket.id == id
      end
    end
  end
end