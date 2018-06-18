#1. DB생성(setup)
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/board.db")

#2.table 생성
class Post
  include DataMapper::Resource
  property :id, Serial     #공통
  property :title, String
  property :content, Text
  property :created_at, DateTime
end


class Blog
  include DataMapper::Resource
  property :id, Serial     #공통
  property :title, String
  property :content, Text
  property :tag, String
  property :image_url, Text
  property :created_at, DateTime
end


#3. DB를 table에 대한 정보를 바탕으로, 최종적으로 확정
DataMapper.finalize

#4. 각 table을 자동으로 업글한다.
Post.auto_upgrade!
Blog.auto_upgrade!
