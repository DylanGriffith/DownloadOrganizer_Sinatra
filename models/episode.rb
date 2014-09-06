class Episode
  attr_reader :file_path, :name, :season, :episode, :double

  def initialize(file_path, name, season, episode, double: false)
    @file_path = file_path
    @name = name
    @season = season
    @episode = episode
    @double = double
  end

  def save_name
    "#{dotted_name}.S#{padded(season)}E#{padded(episode)}#{double_episode_part}#{extension}"
  end

  def show_save_dir_name
    dotted_name
  end

  def season_save_dir_name
    "Season.#{padded(season)}"
  end

  def double?
    @double
  end

  def self.from_hash(data)
    new(data[:file_path], data[:name], data[:season], data[:episode], :double => data[:double])
  end

  def to_hash
    {
      :file_path => file_path,
      :name => name,
      :season => season,
      :episode => episode,
      :double => double
    }
  end

  private

  def double_episode_part
    if double?
      "E#{padded(episode + 1)}"
    else
      ""
    end
  end

  def extension
    File.extname file_path
  end

  def padded(num)
    sprintf "%02d", num
  end

  def dotted_name
    @name.gsub(/ /, ".")
  end
end
