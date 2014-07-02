require 'sinatra'

Dir["routes/**/*.rb"].each { |f| load(f) }
Dir["lib/**/*.rb"].each { |f| load(f) }
