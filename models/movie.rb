class Movie
  include StringUtils
  # TODO: Support for 2 part movies (cd1, cd2)

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

  def self.from_hash(data)
    new(data[:file_path], data[:name], data[:year])
  end

  def to_hash
    {
      :file_path => file_path,
      :name => name,
      :year => year
    }
  end

  private

  def extension
    File.extname file_path
  end
end
