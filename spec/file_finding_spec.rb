require 'spec_helper'

class TestClass
  include FileFinding
end

describe FileFinding do
  let(:test_class) { TestClass.new }
  let(:files) do
    [
      Pathname.new("./spec/test_dir/test1/somedir/anotherfile.mp3").expand_path.to_s,
      Pathname.new("./spec/test_dir/test1/somefile.iso").expand_path.to_s,
      Pathname.new("./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv").expand_path.to_s,
      Pathname.new("./spec/test_dir/test1/The.Office.S03E05/to.mkv").expand_path.to_s
    ]
  end

  describe '::find_all' do
    it 'finds all the files in the path recursively' do
      test_dir = File.join Global.root, "spec/test_dir/test1"
      expect(test_class.find_all(test_dir).to_set).to eq(files.to_set)
    end

    it 'works when the directories have spaces' do
      test_dir = File.join Global.root, "spec/test_dir/test2"
      expected = [ Pathname.new("./spec/test_dir/test2/The Dark Knight Rises/The.Dark.Knight.Rises.2012.avi").expand_path.to_s ]
      expect(test_class.find_all(test_dir)).to eq(expected)
    end
  end

  describe '::filter_all_but_videos' do
    it 'removes all files that are not videos' do
      expected = [
        Pathname.new("./spec/test_dir/test1/The.Dark.Knight.Rises.2012/The.Dark.Knight.Rises.2012.mkv").expand_path.to_s,
        Pathname.new("./spec/test_dir/test1/The.Office.S03E05/to.mkv").expand_path.to_s
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
