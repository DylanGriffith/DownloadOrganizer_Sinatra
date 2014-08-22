class DirectoryWithMatchesFinder
  # Finds all directories in the root directory
  # that are included in matched_paths.
  # eg.
  #   directories("/a/b", ["/a/b/c/d", "/a/b/f/a/c", "/a/b/f/b/a/d", "/a/b/v/foo/bar"])
  #   => ["/a/b/c", "/a/b/f", "/a/b/v"]
  def self.directories(root_path, matched_paths)
    root = Pathname.new(root_path)
    matched_paths.map do |p|
      path = Pathname.new(p)
      root.join(top_dir(path.relative_path_from(root)))
    end.uniq
  end

  private

  def self.top_dir(path)
    path.descend { |p| return p }
  end
end
