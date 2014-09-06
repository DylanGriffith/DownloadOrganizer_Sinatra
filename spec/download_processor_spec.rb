require 'spec_helper'

describe DownloadProcessor do
  let(:data) do
    {
      :items_with_matches => [
        "The.Dark.Knight.Rises.2012",
        "The.Office.S03E05"
      ],
      :episode_matches => [
        {
          :file_path => Pathname.new(Global.root).join("spec/test_dir/downloads/The.Office.S03E05/to.mkv").expand_path.to_s,
          :name=>"The Office",
          :season => 3,
          :episode => 5,
          :double => false
        }
      ],
      :movie_matches=>[
        {
          :file_path => Pathname.new(Global.root).join("spec/test_dir/downloads/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv").expand_path.to_s,
          :name => "The Dark Knight Rises",
          :year => 2012
        }
      ]
    }
  end
  describe '::process_from_hash' do
    let(:downloads_dir_source) { Pathname.new(Global.root).join(Pathname.new("spec/test_dir/test1")) }
    let(:downloads_dir) { Pathname.new(Global.root).join(Pathname.new("spec/test_dir/downloads")) }
    let(:shows_dir) { Pathname.new(Global.root).join(Pathname.new("spec/test_dir/shows")) }
    let(:movies_dir) { Pathname.new(Global.root).join(Pathname.new("spec/test_dir/movies")) }

    def try_rescue(&blk)
      blk.call
    rescue
    end

    before do
      try_rescue { downloads_dir.rmtree }
      try_rescue { shows_dir.rmtree }
      try_rescue { movies_dir.rmtree }

      FileUtils.cp_r downloads_dir_source.to_s, downloads_dir.to_s

      shows_dir.mkdir
      movies_dir.mkdir
    end

    after do
      try_rescue { downloads_dir.rmtree }
      try_rescue { shows_dir.rmtree }
      try_rescue { movies_dir.rmtree }
    end

    it 'moves the episodes' do
      DownloadProcessor.process_from_hash(data, :shows_dir => shows_dir.to_s, :movies_dir => movies_dir.to_s, :downloads_dir => downloads_dir.to_s)
      expect(shows_dir.join("The.Office")).to be_directory
      expect(shows_dir.join("The.Office/Season.03")).to be_directory
      expect(shows_dir.join("The.Office/Season.03/The.Office.S03E05.mkv")).to be_file
    end

    it 'moves the movies' do
      DownloadProcessor.process_from_hash(data, :shows_dir => shows_dir.to_s, :movies_dir => movies_dir.to_s, :downloads_dir => downloads_dir.to_s)
      expect(movies_dir.join("The.Dark.Knight.Rises.(2012)")).to be_directory
      expect(movies_dir.join("The.Dark.Knight.Rises.(2012)/The.Dark.Knight.Rises.(2012).mkv")).to be_file
    end

    it 'deletes the items_with_matches' do
      DownloadProcessor.process_from_hash(data, :shows_dir => shows_dir.to_s, :movies_dir => movies_dir.to_s, :downloads_dir => downloads_dir.to_s)
      expect(downloads_dir.join("The.Dark.Knight.Rises.2012")).to_not be_directory
      expect(downloads_dir.join("The.Office")).to_not be_directory
    end
  end
end
