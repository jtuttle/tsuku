require "tsuku/version"

module Tsuku
  begin
    require 'pry-byebug'
  rescue LoadError
    # development dependencies
  end
    
  Gem.find_files("tsuku/**/*.rb").each { |path| require path }
end
