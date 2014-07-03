get "/downloads" do
  haml :main_layout do
    haml :downloads
  end
end

get "/assets/css/main.css" do
  sass :'sass/main'
end
