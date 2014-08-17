class EpisodeNnxnnMatcher
  extend StringUtils

  EPISODE_REGEX_PART = '(\d\d)x(\d\d)'
  REGEX = /.*\/(\w#{title_chars}+)#{EPISODE_REGEX_PART}/i

  # Matches episodes of the form
  # Show.Name.01x03.mkv
  def self.match(file_path)
    if REGEX.match(file_path)
      Episode.new(file_path, normalize_name($1), $2.to_i, $3.to_i)
    end
  end
end
