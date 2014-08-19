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
end
