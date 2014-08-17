class Movie
  attr_reader :file_path, :name, :year

  def initialize(file_path, name, year)
    @file_path = file_path
    @name = name
    @year = year
  end

  def save_name
    "#{dotted_name}.(#{year})#{extension}"
  end

  def save_dir_name
    "#{dotted_name}.(#{year})"
  end

  private

  def extension
    File.extname file_path
  end

  def dotted_name
    @name.gsub(/ /, ".")
  end
end
