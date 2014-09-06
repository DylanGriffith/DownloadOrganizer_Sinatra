class SearchResult
  attr_accessor :episodes, :movies
  def initialize
    @episodes = []
    @movies = []
  end

  def add_match(match)
    if match.is_a? Episode
      @episodes << match
    elsif match.is_a? Movie
      @movies << match
    end
  end

  def items_with_matches
    DirectoryWithMatchesFinder.directories(Global.settings.downloads_dir, (@movies + @episodes).map(&:file_path)).uniq
  end

  def to_hash
    {
      :episode_matches => @episodes.map(&:to_hash),
      :movie_matches => @movies.map(&:to_hash),
      :items_with_matches => items_with_matches
    }
  end
end
