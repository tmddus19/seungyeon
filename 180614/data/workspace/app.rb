require 'sinatra'
require 'data_mapper'
#데이터 베이스 파일 하나를 생성해서 사용하겠다. (setup)
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

# blog라는 Database 안에 Post라는 테이블(표)를 만들어서 사용할거야
#

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

class Member
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :major, String
  property :year, String
  property :phone_number, String
  property :email, String
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!
Member.auto_upgrade!

get '/' do
  @posts = []
  @posts = Post.all
  erb :index
end

get '/create' do
    @title = params[:title]
    @content = params[:content]
    
    Post.create(
        title: @title,
        body: @content
    )
    redirect '/'
end

get '/register' do
    erb :register 
end

get '/signup' do
    @name = params[:name]
    @major = params[:major]
    @year = params[:year]
    @phone_number = params[:phone_number]
    @email = params[:email]
    
    Member.create(
        name: @name,
        major: @major,
        year: @year,
        phone_number: @phone_number,
        email: @email
      
      )
    redirect '/register'
end

get '/list' do
  @members = Member.all
    erb :list 
end