require "bundler/setup"
require "sinatra/base"

module Shop
  PRODUCTS = [
    Product.new('cheese', 10),
    Product.new('milk', 5),
    Product.new('butter', 15)
  ]

  class App < Sinatra::Base
    get "/" do
      products = FetchProducts.new.call
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
      AddToBasket.new(params).call
      redirect "/"
    end
  end
end


