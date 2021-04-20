class SinatraApplication < Sinatra::Base

  get "/hello" do
    erb :test
  end

  get "/restaurants/:kind_of_food" do
    "<h1>#{params[:kind_of_food]}!!!!!!!</h1>"
  end

  get "/nouns" do
    @nouns = ["Batman", "Cheese", "Squirrel", "Yolo"]
    erb :nouns
  end


  get '/bad_path_for_dummies' do
    "Hello World"
  end

end
