require 'spec_helper'

class TestClass
  include FileFinding
end

describe FileFinding do
  let(:test_class) { TestClass.new }
  let(:files) do
    [
      "./spec/test_dir/test1/somedir/anotherfile.mp3",
      "./spec/test_dir/test1/somefile.iso",
      "./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv",
      "./spec/test_dir/test1/The.Office.S03E05/to.mkv"
    ]
  end

  describe '::find_all' do
    it 'finds all the files in the path recursively' do
      test_dir = File.join Global.root, "spec/test_dir/test1"
      expect(test_class.find_all(test_dir).to_set).to eq(files.to_set)
    end

    it 'works when the directories have spaces' do
      test_dir = File.join Global.root, "spec/test_dir/test2"
      expected = [ "./spec/test_dir/test2/The Dark Knight Rises/The.Dark.Knight.Rises.2012.avi" ]
      expect(test_class.find_all(test_dir)).to eq(expected)
    end
  end

  describe '::filter_all_but_videos' do
    it 'removes all files that are not videos' do
      expected = [
        "./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv",
        "./spec/test_dir/test1/The.Office.S03E05/to.mkv"
      ]
      expect(test_class.filter_all_but_videos(files)).to eq(expected)
    end
  end

  describe 'filter_samples' do
    it 'removes suspected samples' do
      all = [
        "./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv",
        "./spec/test_dir/test1/The.Office.S03E05/to.mkv",
        "./spec/test_dir/test1/sample/the.movie.2013.mkv",
        "./spec/test_dir/test1/the.movie.2013/sample.mkv",
        "./spec/test_dir/test1/the.movie.2013/the.movie.2013.Sample.mkv",
      ]
      expected = [
        "./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv",
        "./spec/test_dir/test1/The.Office.S03E05/to.mkv"
      ]
      expect(test_class.filter_samples(all)).to eq(expected)
    end
  end
end
