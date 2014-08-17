require 'sinatra'
require 'json'
require 'coffee_script'
require './downloads'
require './assets'

require './lib/string_utils'
Dir["lib/**/*.rb"].each { |f| load(f) }
Dir["models/**/*.rb"].each { |f| load(f) }
