class SinatraApplication < Sinatra::Base

  get "/hello" do
    @stuff_nicky_says = ["Batman", "Cheese", "Beef", "Swag", "Laura Dern"]
    erb :'static/test'
  end

end
