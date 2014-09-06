class Global
  def self.root
    File.dirname(File.dirname(__FILE__))
  end

  def self.settings
    Settings.new
  end
end
