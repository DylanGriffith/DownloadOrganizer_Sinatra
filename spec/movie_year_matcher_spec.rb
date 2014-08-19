require 'spec_helper'

describe MovieYearMatcher do
  describe '::match' do
    it 'matches the ./the.dark.knight.rises.2012.avi' do
      path = "./the.dark.knight.rises.2012.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("The Dark Knight Rises")
      expect(result.year).to eq(2012)
    end

    it 'matches the ./The.Dark.Knight.Rises.(2012).avi' do
      path = "./The.Dark.Knight.Rises.(2012).avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("The Dark Knight Rises")
      expect(result.year).to eq(2012)
    end

    it 'matches the ./The.Dark.Knight.Rises.(2012)/rubbish.avi' do
      path = "./The.Dark.Knight.Rises.(2012)/rubbish.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("The Dark Knight Rises")
      expect(result.year).to eq(2012)
    end

    it 'matches the ./The.Dark.Knight.Rises.2012/rubbish.avi' do
      path = "./The.Dark.Knight.Rises.2012/rubbish.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("The Dark Knight Rises")
      expect(result.year).to eq(2012)
    end

    it 'matches the ./Some.Title.2012/The.Dark.Knight.Rises.2012.avi as The Dark Knight Rises' do
      path = "./Some.Title.2012/The.Dark.Knight.Rises.2012.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("The Dark Knight Rises")
      expect(result.year).to eq(2012)
    end

    it 'matches ./Some.Title.1990.avi' do
      path = "./Some.Title.1990.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("Some Title")
      expect(result.year).to eq(1990)
    end

    it 'matches ./Some Title 1990.avi' do
      path = "./Some Title 1990.avi"
      result = MovieYearMatcher.match(path)
      expect(result.file_path).to eq(path)
      expect(result.name).to eq("Some Title")
      expect(result.year).to eq(1990)
    end

    it 'doesnt match ./Some.Title.1080.avi' do
      path = "./Some.Title.1080.avi"
      result = MovieYearMatcher.match(path)
      expect(result).to be_nil
    end
  end
end
