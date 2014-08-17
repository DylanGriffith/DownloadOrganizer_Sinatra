require 'spec_helper'

describe Episode do
  describe '#name' do
    it 'returns the name' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.name).to eq("24")
    end
  end

  describe '#season' do
    it 'returns the season' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.season).to eq(3)
    end
  end

  describe '#episode' do
    it 'returns the episode' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.episode).to eq(9)
    end
  end

  describe '#save_name' do
    it 'returns the file name to save the episode as' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.save_name).to eq("24.S03E09.avi")
    end
  end

  describe '#show_save_dir_name' do
    it 'returns the directory name for the show' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.show_save_dir_name).to eq("24")
    end
  end

  describe '#season_save_dir_name' do
    it 'returns the directory name for the season' do
      e = Episode.new("/some/directory/with/24.avi", "24", 3, 9)
      expect(e.season_save_dir_name).to eq("Season.03")
    end
  end
end
