require 'sinatra'
require 'json'
require 'coffee_script'

Dir["routes/**/*.rb"].each { |f| load(f) }
Dir["lib/**/*.rb"].each { |f| load(f) }
Dir["models/**/*.rb"].each { |f| load(f) }
