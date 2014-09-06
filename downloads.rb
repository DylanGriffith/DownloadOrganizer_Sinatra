class DownloadOrganizer < Sinatra::Base
  get "/" do
    redirect "/downloads"
  end

  get "/downloads.json" do
    content_type :json
    DownloadManager.new(Global.settings.downloads_dir).search.to_hash.to_json
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
