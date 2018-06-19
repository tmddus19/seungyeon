
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/Twitter.db")

class Tweet
    include DataMapper::Resource
    property :id, Serial  # 공통
    property :name, String
    property :content, Text
    property :created_at, DateTime
end


class User
    include DataMapper::Resource
    property :id, Serial  # 공통
    property :email, String
    property :password, String
    property :created_at, DateTime
end

DataMapper.finalize

Tweet.auto_upgrade!
User.auto_upgrade!
