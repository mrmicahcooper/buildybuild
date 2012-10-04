ENV["RAILS_ENV"] = 'test'

$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'rails/all'
require 'rails/generators'
require 'test/unit'
require 'buildybuild'
