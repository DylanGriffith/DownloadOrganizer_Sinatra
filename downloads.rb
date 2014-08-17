class DownloadOrganizer < Sinatra::Base

  get "/downloads.json" do
    content_type :json
    {"episode_matches"=>[], "movie_matches"=>[], "ignored_files"=>[{"ignored_reason"=>"not_video_or_first_rar"}, {"ignored_reason"=>"not_video_or_first_rar"}, {"ignored_reason"=>"not_video_or_first_rar"}, {"ignored_reason"=>"not_video_or_first_rar"}, {"ignored_reason"=>"not_video_or_first_rar"}], "unknown_files"=>[], "items_with_matches"=>[]}.to_json
  end

  post "/downloads" do
    content_type :json
    status 200
    body {}.to_json
  end

  get "/downloads" do
    haml :main_layout do
      haml :downloads
    end
  end
end
