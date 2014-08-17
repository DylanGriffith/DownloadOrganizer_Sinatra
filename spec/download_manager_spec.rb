require 'spec_helper'

describe DownloadManager do
  let(:test_dir) { 'spec/test_dir/test1' }
  describe '#search' do
    it 'finds tv shows' do
      result = DownloadManager.new(test_dir).search
      show = result.shows[0]
      expect(show.name).to eq("The Office")
      expect(show.season).to eq(3)
      expect(show.episode).to eq(5)
      expect(show.save_name).to eq("The.Office.S03E05.avi")
      expect(show.show_save_dir_name).to eq("The.Office")
      expect(show.season_save_dir_name).to eq("Season.03")
    end

    it 'finds movies' do
      result = DownloadManager.new(test_dir).search
      movie = result.shows[0]
      expect(movie.name).to eq("The Dark Knight Rises")
      expect(movie.year).to eq("2012")
      expect(movie.save_name).to eq("The.Dark.Knight.Rises.(2012).mkv")
      expect(movie.save_dir_name).to eq("The.Dark.Knight.Rises.(2012)")
    end
  end
end
