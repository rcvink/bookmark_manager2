ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'rake'
require './app/model/link'
require './app/model/user'
require 'sinatra/base'

class Bookmark < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/links'do
    @bookmarks = Link.all
    @current_user_email = session[:email]
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split(',').map(&:strip).each { |single_tag| link.tags << Tag.create(tag: single_tag) }
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @bookmarks = Link.all(Link.tags.tag => params[:tag])
    erb :links
  end

  post '/login' do
    user = User.create(email: params[:emai], password: params[:password])
    session[:email] = params[:email]
    user.save
    redirect '/links'
  end

run! if app_file == $0
end
