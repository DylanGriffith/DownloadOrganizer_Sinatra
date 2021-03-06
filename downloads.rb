class DownloadOrganizer < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  get "/" do
    redirect "/downloads"
  end

  get "/downloads.json" do
    content_type :json
    DownloadManager.new(Global.settings.downloads_dir).search.to_hash.to_json
  end

  post "/downloads" do
    content_type :json
    request.body.rewind
    data = JSON.parse request.body.read, :symbolize_names => true
    DownloadProcessor.process_from_hash(data, logger: logger)
    status 200
    body {}.to_json
  end

  get "/downloads" do
    haml :main_layout do
      haml :downloads
    end
  end
end
