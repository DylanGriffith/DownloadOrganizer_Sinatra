require 'spec_helper'

describe DirectoryWithMatchesFinder do
  describe '::directories' do
    it 'finds directories in the root that are in the matched_paths' do
      result = DirectoryWithMatchesFinder.directories("/a/b", ["/a/b/c/d", "/a/b/f/a/c", "/a/b/f/b/a/d", "/a/b/v/foo/bar"])
      expected = ["c", "f", "v"].map { |p| Pathname.new(p) }
      expect(result).to eq(expected)
    end

    it 'works with empty matched_paths' do
      result = DirectoryWithMatchesFinder.directories("/a/b", [])
      expect(result).to eq([])
    end

    it 'works with relative paths' do
      result = DirectoryWithMatchesFinder.directories("a/b", ["a/b/c/d", "a/b/f/a/c", "a/b/f/b/a/d", "a/b/v/foo/bar"])
      expected = ["c", "f", "v"].map { |p| Pathname.new(p) }
      expect(result).to eq(expected)
    end

    it 'works with one level deep' do
      result = DirectoryWithMatchesFinder.directories("a/b", ["a/b/c", "a/b/f", "a/b/v"])
      expected = ["c", "f", "v"].map { |p| Pathname.new(p) }
      expect(result).to eq(expected)
    end
  end

  describe '::in_root' do
    it 'is true if the path is in the root' do
      result = DirectoryWithMatchesFinder.in_root?("/a/b", "/a/b/c")
      expect(result).to eq(true)
    end

    it 'is false if the path is not in the root' do
      result = DirectoryWithMatchesFinder.in_root?("/a/b", "/a")
      expect(result).to eq(false)
    end

    it 'is false if it contains .. to make it not in the root' do
      result = DirectoryWithMatchesFinder.in_root?("/a/b", "/a/b/c/../..")
      expect(result).to eq(false)
    end
  end
end
