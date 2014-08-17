class Episode
  attr_reader :file_path, :name, :season, :episode

  def initialize(file_path, name, season, episode)
    @file_path = file_path
    @name = name
    @season = season
    @episode = episode
  end

  def save_name
    "#{dotted_name}.S#{padded(season)}E#{padded(episode)}#{extension}"
  end

  def show_save_dir_name
    dotted_name
  end

  def season_save_dir_name
    "Season.#{padded(season)}"
  end

  private

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
