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
    configure :test do
      set :dump_errors, false
    end

    get "/" do
      products = FetchBasketItemList.new.call
      erb :"products/index", locals: { products: products, title: "Products" }
    end

    get "/products/:id" do |id|
      product = FetchProduct.new.call(id)
      halt 404 unless product
      erb :"products/show", locals: { product: product }
    end

    get "/basket" do
      items_in_basket = FetchBasket.new.call
      erb :"basket/show", locals: { basket: items_in_basket }
    end

    post "/basket" do
      begin
        AddItemToBasket.new(params).call
        DeleteItemFromWarehouse.new(params).call
        redirect "/"
      rescue KeyError
        halt 422
      end
    end

    post "/basket/delete" do
      begin
        DeleteItemFromBasket.new(params).call
        AddItemToBasket.new(params).call
      rescue ProductNotFound
        halt 404
      rescue NotInBasket
        halt 404
      end
      redirect "/basket"
    end
  end
end
