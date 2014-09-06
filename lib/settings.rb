require 'yaml'

class Settings
  def initialize
  end

  def [](key)
    config[key]
  end

  def downloads_dir
    config['downloads_dir']
  end

  def movies_dir
    config['movies_dir']
  end

  def shows_dir
    config['shows_dir']
  end

  def username
    config['username']
  end

  def password
    config['password']
  end

  def overwrite_files?
    config['overwrite_files']
  end

  def delete_files?
    config['delete_files']
  end

  def config
    @config = YAML.load_file(Pathname.new(Global.root).join("config/settings.yml"))
  end
end
