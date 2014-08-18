require 'spec_helper'

describe EpisodeSnnennDoubleMatcher do
  describe '::match' do
    it 'matches path/The Simpsons S12E0102.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/The Simpsons S12E0102.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(12)
      expect(result.episode).to eq(1)
      expect(result).to be_double
    end

    it 'matches path/The Simpsons S12E01E02.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/The Simpsons S12E01E02.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(12)
      expect(result.episode).to eq(1)
      expect(result).to be_double
    end

    it 'matches path/The Simpsons s12e01-02.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/The Simpsons s12e01-02.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(12)
      expect(result.episode).to eq(1)
      expect(result).to be_double
    end

    it 'matches path/The Simpsons s12e01-e02.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/The Simpsons s12e01-e02.mkv")
      expect(result.name).to eq("The Simpsons")
      expect(result.season).to eq(12)
      expect(result.episode).to eq(1)
      expect(result).to be_double
    end

    it 'doesnt match path/The.Simpsons.s12e01-e20/the.simpsons.s12e05.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/The.Simpsons.s12e01-e20/the.simpsons.s12e05.mkv")
      expect(result).to be_nil
    end

    it 'doesnt match path/to/The Simpsons.S13E04.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/to/The Simpsons.S13E04.mkv")
      expect(result).to be_nil
    end

    it 'doesnt match path/to/The.Simpsons.13x04.mkv' do
      result = EpisodeSnnennDoubleMatcher.match("path/to/The.Simpsons.13x04.mkv")
      expect(result).to be_nil
    end
  end
end
