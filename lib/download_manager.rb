class DownloadManager
  include FileFinding

  def initialize(directory)
    @directory = directory
  end

  def search
    files = find_all(@directory)
    files = filter_all_but_videos(files)
    files = filter_samples(files)
    SearchResult.new.tap do |result|
      files.each { |f| result.add_match(find_match(f)) }
    end
  end

  def find_match(file_path)
    matchers.each do |matcher|
      match = matcher.match(file_path)
      return match if match
    end
    nil
  end

  private

  def matchers
    [
      EpisodeSnnennDoubleMatcher,
      EpisodeNnxnnDoubleMatcher,
      EpisodeSnnennMatcher,
      EpisodeNnxnnMatcher,
      MovieYearMatcher
    ]
  end
end
