require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model'

enable :sessions


get '/' do
    @tweets = Tweet.all
    if session[:email]# 로그인이 되어있을 경우에만
        erb :index
    else
        redirect '/login'
    end
end

get '/create' do

     Tweet.create(
        name: params[:name],
        content: params[:content]
     )
     
     redirect '/'
end

get '/signup' do
     erb :signup
end

get '/register' do
     
     User.create(
        email: params[:email],
        password: params[:password]
     )
     redirect '/'
end

get '/admin' do
    
    @users = User.all
    erb :admin 
end

get '/login' do
    erb :login 
end

get '/login_session' do
   # 사용자를 로그인 시킨다
   # == 만약에 사용자가 유효하다면(email, pw == DB에 저장된 email, pw)  
   # session에 사용자를 저장한다.
   
   @msg = "로그인 실패(DB에 없음)"

   @users = User.all
   
    @users.each do |u|
        if u.email == params[:email] && u.password == params[:password]
            @msg = "로그인 성공"
            session[:email] = u.email
        end
    end
    erb :login_session
end

get '/logout' do
    #로그아웃 시킨다 
    session.clear
    redirect '/'
end
