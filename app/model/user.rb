class User
  include DataMapper::Resource

  property :id,     Serial
  property :email,    String
  property :password,    String

  # has n, :links, :through => Resource
end
