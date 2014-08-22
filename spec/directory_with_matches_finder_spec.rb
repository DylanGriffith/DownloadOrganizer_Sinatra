require 'spec_helper'

describe DirectoryWithMatchesFinder do
  describe '::directories' do
    it 'finds directories in the root that are in the matched_paths' do
      result = DirectoryWithMatchesFinder.directories("/a/b", ["/a/b/c/d", "/a/b/f/a/c", "/a/b/f/b/a/d", "/a/b/v/foo/bar"])
      expected = ["/a/b/c", "/a/b/f", "/a/b/v"].map { |p| Pathname.new(p) }
      expect(result).to eq(expected)
    end

    it 'works with empty matched_paths' do
      result = DirectoryWithMatchesFinder.directories("/a/b", [])
      expect(result).to eq([])
    end

    it 'works with relative paths' do
      result = DirectoryWithMatchesFinder.directories("a/b", ["a/b/c/d", "a/b/f/a/c", "a/b/f/b/a/d", "a/b/v/foo/bar"])
      expected = ["a/b/c", "a/b/f", "a/b/v"].map { |p| Pathname.new(p) }
      expect(result).to eq(expected)
    end
  end
end
