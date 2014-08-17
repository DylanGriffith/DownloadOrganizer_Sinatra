RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../main")
require 'pry'

RSpec.configure do |conf|
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Tokens::App
#   app Tokens::App.tap { |a| }
#   app(Tokens::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
