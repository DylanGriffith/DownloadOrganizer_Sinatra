require 'string_utils'

class MovieYearMatcher
  extend StringUtils

  REGEX = /.*\/(\w#{title_chars}+)[\(\[]?((19|20)\d\d)[\]\)]?/i

  # This matches based on the file
  # containing a title followed by
  # a 4 digit year either 19XX or
  # 20XX
  def self.match(file_path)
    if REGEX.match(file_path)
      Movie.new(file_path, normalize_name($1), $2.to_i)
    end
  end
end
