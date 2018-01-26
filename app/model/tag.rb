class Tag
  include DataMapper::Resource

  property :id,     Serial
  property :label,    String

  has n, :links, :through => Resource
end
