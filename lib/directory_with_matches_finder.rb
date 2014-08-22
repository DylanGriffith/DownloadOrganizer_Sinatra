class DirectoryWithMatchesFinder
  # Finds all directories in the root directory
  # that are included in matched_paths.
  # eg.
  #   directories("/a/b", ["/a/b/c/d", "/a/b/f/a/c", "/a/b/f/b/a/d", "/a/b/v/foo/bar"])
  #   => ["c", "f", "v"]
  def self.directories(root_path, matched_paths)
    root = Pathname.new(root_path)
    matched_paths.map do |p|
      path = Pathname.new(p)
      top_dir(path.relative_path_from(root))
    end.uniq
  end

  def self.in_root?(root_path, path)
    path = Pathname.new(path).cleanpath
    root = Pathname.new(root_path).cleanpath
    path.descend do |p|
      return true if path.to_s.start_with? root.to_s
    end
    false
  end

  private

  def self.top_dir(path)
    path.descend { |p| return p }
  end
end
