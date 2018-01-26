require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  property :id,             Serial
  property :email,          String
  property :password_hash,  Text

  # has n, :links, :through => Resource
end
