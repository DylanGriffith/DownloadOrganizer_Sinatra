require 'spec_helper'

describe Movie do
  let(:movie) { Movie.new("/path/to/bourne.mkv", "The Bourne Identity", 2001) }

  describe '#save_name' do
    it 'is the right name to save the movie in' do
      expect(movie.save_name).to eq("The.Bourne.Identity.(2001).mkv")
    end
  end

  describe '#save_dir_name' do
    it 'is the right name to save the movie in' do
      expect(movie.save_dir_name).to eq("The.Bourne.Identity.(2001)")
    end
  end
end
