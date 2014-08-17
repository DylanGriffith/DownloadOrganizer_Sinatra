module FileFinding
  VIDEO_EXTENSIONS = %w[.avi .mov .mp4 .mkv .mpg .wmv .mpeg]

  def find_all(path)
    Dir.glob(File.join(path, "/**/*")).reject { |f| File.directory? f }
  end

  # Return all the files that are
  # assumed to be videos
  def filter_all_but_videos(files)
    files.select { |f| video?(f) }
  end

  # Remove all videos suspected to be
  # samples
  def filter_samples(files)
    files.reject { |f| sample?(f) }
  end

  def sample?(file)
    !!(/\bsample\b/i.match(file))
  end

  def video?(file)
    VIDEO_EXTENSIONS.include? File.extname file
  end
end
