require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new("cheese", 10),
    Product.new("milk", 5),
    Product.new("butter", 15)
  ]

  WAREHOUSE = []
  BASKET = []

  class App < Sinatra::Base
    get "/" do
      products = FetchBasketItemList.new.call
      erb :"products/index", locals: { products: products, title: "Products" }
    end

    get "/products/:id" do |id|
      product = FetchProduct.new.call(id)
      erb :"products/show", locals: { product: product }
    end

    get "/basket" do
      products_in_basket = FetchBasket.new.call
      erb :"basket/show", locals: { basket: products_in_basket }
    end

    post "/basket" do
      AddItemToBasket.new(params).call
      redirect "/"
    end
  end
end
