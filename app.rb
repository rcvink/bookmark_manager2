
# require './lib/link.rb'
require 'sinatra/base'

class Bookmark < Sinatra::Base

  get '/' do
    "empty"
  end

run! if app_file == $0

end
