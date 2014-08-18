class EpisodeSnnennDoubleMatcher
  extend StringUtils

  EPISODE_REGEX_PART = 'S(\d\d)E(\d\d)-?E?(\d\d)'
  REGEX = /.*\/(\w#{title_chars}+)#{EPISODE_REGEX_PART}/i

  # Matches files of the form
  # Show.Name.S01E01-02.avi
  # Show.Name.S01E01-E02.avi
  # Show.Name.S01E0102.avi
  # Show.Name.S01E01E02.avi
  def self.match(file_path)
    if REGEX.match(file_path)
      name, season, episode, next_episode = $1, $2.to_i, $3.to_i, $4.to_i
      return unless next_episode == episode + 1
      Episode.new(file_path, normalize_name(name), season, episode, :double => true)
    end
  end
end
