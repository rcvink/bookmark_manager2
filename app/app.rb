
require './app/model/link'
require 'sinatra/base'
# require 'data_mapper'

class Bookmark < Sinatra::Base

  get '/' do
    "empty"
  end

  get '/links'do
    @bookmarks = Link.all
    erb :links
  end

run! if app_file == $0

end
