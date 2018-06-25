DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/login.db")

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String
  property :created_at, DateTime
end


DataMapper.finalize

User.auto_upgrade!