require 'spec_helper'

describe EpisodeNnxnnMatcher do
  describe '::match' do
    it "matches path/to/The.Simpsons.13x04.mkv" do
      result = EpisodeNnxnnMatcher.match("path/to/The.Simpsons.13x04.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it "path/to/the simpsons 13x04.mkv" do
      result = EpisodeNnxnnMatcher.match("path/to/the simpsons 13x04.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it "matches path/to/the simpsons 13x04 720p xvid.extra.stuff.mkv" do
      result = EpisodeNnxnnMatcher.match("path/to/the simpsons 13x04 720p xvid.extra.stuff.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it "matches path/The Simpsons 12x01/the simpsons 13x04 720p xvid.extra.stuff.mkv as 13x04" do
      result = EpisodeNnxnnMatcher.match("path/The Simpsons 12x01/the simpsons 13x04 720p xvid.extra.stuff.mkv")
      expect(result).to be_a Episode
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(13)
      expect(result.episode).to eq(4)
      expect(result).to_not be_double
    end

    it "doesn't match path/to/Some.Movie.2000.mkv" do
      result = EpisodeNnxnnMatcher.match("path/to/Some.Movie.2000.mkv")
      expect(result).to be_nil
    end
  end
end
