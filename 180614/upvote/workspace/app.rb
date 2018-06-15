require 'sinatra'
require 'sinatra/reloader'
require 'csv'

get '/' do
    erb :index
end

get '/vote' do
    @name = params[:name]
    @pro = params[:pro]
    
    CSV.open("vote.csv", "a+") do |csv|
        csv << [@name, @pro]
    end
    
    erb :vote
end

get '/result' do
    @yes = 0
    @total = 0
    CSV.foreach("vote.csv") do |row|
       @yes += row[1].to_i
       @total += 1
    end
    
    @cheers = []
    CSV.foreach("cheer.csv") do |row|
        @cheers << row
    end
    erb :result
end

get '/cheer' do
    erb :cheer 
end

get '/write' do
    @name = params[:name]
    @msg = params[:msg]
    
    CSV.open("cheer.csv", "a+") do |csv|
        csv << [@name, @msg]
    end
    erb :write 
end

get '/test' do
   "hello world" 
end