require 'sinatra'
require 'json'
require 'coffee_script'
require './downloads'
require './assets'

require './lib/string_utils'
require './lib/file_finding'
Dir[File.join File.dirname(__FILE__), "lib/**/*.rb"].each { |f| require(f) }
Dir[File.join File.dirname(__FILE__), "models/**/*.rb"].each { |f| load(f) }
