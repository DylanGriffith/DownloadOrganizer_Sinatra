class EpisodeSnnennMatcher
  extend StringUtils

  EPISODE_REGEX_PART = 'S(\d\d)E(\d\d)'
  REGEX = /.*\/(\w#{title_chars}+)#{EPISODE_REGEX_PART}/i

  # Matches files of the form
  # Show.Name.S00E00.avi
  def self.match(file_path)
    if REGEX.match(file_path)
      Episode.new(file_path, normalize_name($1), $2.to_i, $3.to_i)
    end
  end
end
