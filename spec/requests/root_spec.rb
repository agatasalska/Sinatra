require "web_helper"

RSpec.describe "GET /", type: :request do
  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "returns h1 element with 'SHOP' value" do
    expect(last_response.body).to include("<h1>SHOP</h1>")
  end

  it "returns link to basket" do
    expect(last_response.body).to include("<a href=\"/basket\">Basket</a>")
  end

  private
  def do_request
    get "/"
  end
end
