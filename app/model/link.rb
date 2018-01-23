require 'data_mapper'
require 'dm-postgres-adapter'


class Link

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String



end
<<<<<<< HEAD
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK-ENV']}")
=======

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
>>>>>>> d919ef1e569783e0c8b2b0f43485be318a3fbad6
DataMapper.finalize
DataMapper.auto_upgrade!
