class EpisodeNnxnnDoubleMatcher
  extend StringUtils

  EPISODE_REGEX_PART = '(\d\d)x(\d\d)-?x?(\d\d)'
  REGEX = /.*\/(\w#{title_chars}+)#{EPISODE_REGEX_PART}/i

  # Matches episodes of the form
  # Show.Name.01x03-04.mkv OR
  # Show.Name.01x03x04.mkv OR
  # Show.Name.01x0304.mkv
  def self.match(file_path)
    if REGEX.match(file_path)
      name, season, episode, next_episode = $1, $2.to_i, $3.to_i, $4.to_i
      return unless next_episode == episode + 1
      Episode.new(file_path, normalize_name(name), season, episode, :double => true)
    end
  end
end
