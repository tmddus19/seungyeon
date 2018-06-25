require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model'

enable :sessions
get '/' do
    erb :index
end

get '/signup' do
    erb :signup
end

post '/register' do
    User.create(
        email: params[:email],
        password: params[:password]
    )
    erb :register
end

get '/login' do
    erb :login
end

post '/sessions' do
    @users = User.all
    @users.each do |u|
        if u.email == params[:email] and u.password == params[:password]
            session[:email] = params[:email]
            redirect '/'
        end
    end
    redirect '/login'
end
