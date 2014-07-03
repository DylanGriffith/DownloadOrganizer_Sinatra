get "/assets/css/*.css" do |css_file_name|
  sass :"sass/#{css_file_name}"
end

get "/assets/javascripts/*.js" do |js_file_name|
  coffee :"javascripts/#{js_file_name}"
end
