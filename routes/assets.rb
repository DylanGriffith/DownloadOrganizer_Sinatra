get "/assets/css/*.css" do |css_file_name|
  sass :"sass/#{css_file_name}"
end

get "/assets/javascript/*.js" do |js_file_name|
  content_type "text/javascript"
  coffee :"coffee/#{js_file_name}"
end
