ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'rake'
require './app/model/link'
require './app/model/user'
require 'sinatra/base'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/login' do
    redirect('/') unless params[:password] == params[:password_confirmation] 
    user = User.create(email: params[:email], password: params[:password])
    user.save
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links'do
    @bookmarks = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split(',').map(&:strip).each { |single_tag| link.tags << Tag.create(label: single_tag) }
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @bookmarks = Link.all(Link.tags.label => params[:tag])
    erb :links
  end

  helpers do
    def current_user
      @current_user ||= User.get!(session[:user_id])
    end
  end

  run! if app_file == $0
end
