RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../app")
require 'pry'

RSpec.configure do |conf|
end
