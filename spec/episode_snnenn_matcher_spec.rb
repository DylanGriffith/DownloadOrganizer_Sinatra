require 'spec_helper'

describe EpisodeSnnennMatcher do
  describe '::match' do
    it 'matches /path/to/The.Simpsons.S13E04.mkv' do
      result = EpisodeSnnennMatcher.match("/path/to/The.Simpsons.S13E04.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it 'matches /path/to/The Simpsons.S13E04.mkv' do
      result = EpisodeSnnennMatcher.match("/path/to/The Simpsons.S13E04.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it 'matches /path/to/The Simpsons S13E04 720p xvid.mkv' do
      result = EpisodeSnnennMatcher.match("/path/to/The Simpsons S13E04 720p xvid.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it 'matches /path/to/The.Simpsons.S13E01-20/The Simpsons S13E04 720p xvid.mkv as episode 4' do
      result = EpisodeSnnennMatcher.match("/path/to/The.Simpsons.S13E01-20/The Simpsons S13E04 720p xvid.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it 'doesnt match path/to/Jack Reacher 2013.mp4' do
      result = EpisodeSnnennMatcher.match("path/to/Jack Reacher 2013.mp4")
      expect(result).to be_nil
    end
  end
end
