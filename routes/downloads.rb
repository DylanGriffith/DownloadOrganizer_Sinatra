get "/downloads" do
  haml :main_layout do
    haml :downloads
  end
end

get "/assets/css/*.css" do |css_file_name|
  sass :"sass/#{css_file_name}"
end
