require 'spec_helper'

describe EpisodeNnxnnDoubleMatcher do
  describe '::match' do
    it 'matches ./The.Simpsons.13x04-05.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("./The.Simpsons.13x04-05.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to be_double
    end

    it 'matches path/to/The.Simpsons.13x04-05.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("path/to/The.Simpsons.13x04-05.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to be_double
    end

    it 'matches path/to/The.Simpsons.13x04-05/file.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("path/to/The.Simpsons.13x04-05/file.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to be_double
    end

    it 'matches path/The Simpsons 13x01x02.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("path/The Simpsons 13x04x05.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to be_double
    end

    it 'matches path/The Simpsons 13x0102.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("path/The Simpsons 13x0405.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to be_double
    end

    it 'doesnt match ./friends.s01e01.mkv' do
      result = EpisodeNnxnnDoubleMatcher.match("./friends.s01e01.mkv")
      expect(result).to be_nil
    end
  end
end
