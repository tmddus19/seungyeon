require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/question.db")

class Question  #꼭 대문자
  include DataMapper::Resource
  property :id, Serial
  property :name, String  #Text는 더 많은 글자를 저장할 수 있다.
  property :question, Text
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Question.auto_upgrade!

get '/' do
    
    @questions = Question.all
    erb :index
    
end

get '/ask' do
    @name = params[:name]
    @question = params[:question]
    
    Question.create(
        name: @name,
        question: @question
    )
    
    redirect '/'
end