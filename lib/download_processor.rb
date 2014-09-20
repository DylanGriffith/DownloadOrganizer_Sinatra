class DownloadProcessor
  def self.process_from_hash(data, downloads_dir: Global.settings.downloads_dir, shows_dir: Global.settings.shows_dir, movies_dir: Global.settings.movies_dir, logger: nil)
    episodes = data[:episode_matches].map { |e| Episode.from_hash(e) }
    movies = data[:movie_matches].map { |m| Movie.from_hash(m) }
    to_delete = data[:items_with_matches]
    process(episodes, movies, to_delete, shows_dir, movies_dir, downloads_dir, logger)
  end

  private

  def self.process(episodes, movies, to_delete, shows_dir, movies_dir, downloads_dir, logger)
    episodes.each { |e| process_episode(e, shows_dir, logger) }
    movies.each { |m| process_movie(m, movies_dir, logger) }
    to_delete.each { |p| remove(p, downloads_dir, logger) }
  end

  def self.process_episode(episode, shows_dir, logger)
    # Find or create the directory for the show
    show = Pathname.new(shows_dir).join(episode.show_save_dir_name)
    raise "#{show} exists and is not a directory?" if show.file? && !show.directory?
    show.mkdir unless show.directory?

    # Find or create the directory for the season
    season = Pathname.new(shows_dir).join(episode.show_save_dir_name).join(episode.season_save_dir_name)
    raise "#{season} exists and is not a directory?" if season.file? && !season.directory?
    season.mkdir unless season.directory?

    # Move the file to the season directory
    destination = season.join(episode.save_name)
    logger.info "EPISODE: moving #{episode.file_path} to #{destination}" if logger
    FileUtils.mv episode.file_path, destination
  end

  def self.process_movie(movie, movies_dir, logger)
    # Create directory for movie
    dir = Pathname.new(movies_dir).join(movie.save_dir_name)
    raise "#{dir} exists and is not a directory?" if dir.file? && !dir.directory?
    dir.mkdir unless dir.directory?

    # Move the file to the movie directory
    destination = dir.join(movie.save_name)
    logger.info "MOVIE: moving #{movie.file_path} to #{destination}" if logger
    FileUtils.mv movie.file_path, destination
  end

  def self.remove(path, downloads_dir, logger)
    delete_path = Pathname.new(downloads_dir).join(path)
    logger.info "MATCHES: removing #{delete_path}" if logger
    FileUtils.rm_rf delete_path.to_s
  end

end
