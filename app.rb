require "sinatra/base"

class App < Sinatra::Base
  get "/" do
    @products = FetchProducts.new.call
    erb :"products/index", locals: { products: products }
  end
    
  end
end