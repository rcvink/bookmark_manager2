require './app/app'
ENV["RACK-ENV"] ||= ‘_development’
run Bookmark
