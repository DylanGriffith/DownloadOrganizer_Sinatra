module StringUtils
  TITLE_CHARS = '[.\w\s\-]' unless defined? TITLE_CHARS

  def normalize_name(name)
    name.gsub(/\./, " ").gsub(/\s\s+/, " ").gsub(/ +$/, "").split.map(&:capitalize).join(' ')
  end

  def dotted_name
    @name.gsub(/ /, ".")
  end

  def title_chars
    TITLE_CHARS
  end
end
