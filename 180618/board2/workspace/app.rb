require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model' # DB 관련 내용

get '/' do
    @posts = Post.all #[Post 테이블에 저장된 모든 기록(배열)]
    
    erb :index
end

get '/create' do
   @title = params[:title]
   @content = params[:content]
   
   Post.create(
        title: @title,
        content: @content
   )
   
   redirect '/'
end

get '/show/:id' do
    # 제목을 클릭했을 때 해당하는 글의 내용을 보여줄거다.
    # 1번글 클릭했을때는 1, 2번글 클릭했을때는 2
    
    @post = Post.get(params[:id])
    erb :show
end

get '/destroy/:id' do
    #/destroy/1
    #1. id 1인 데이터를 찾아서
    #2. 지운다.
    post = Post.get(params[:id])
    post.destroy
    
    redirect '/'
end

get '/edit/:id' do
     @post = Post.get(params[:id])
     erb :edit
end

get '/update/:id' do
    #DB에 내용을 업데이트 한다.
    #1. id x인 데이터를 찾아서
    #2. 업데이트 한다.
    
    post = Post.get(params[:id])
    post.update(
         title: params[:title],
         content: params[:content]
    )
    
    redirect '/'
end

get '/blogs' do
    # Database의 저장된 모든 blog를 불러와서 보여준다.
    @blogs = Blog.all
    erb :blogs 
end

get '/blogs/new' do
    erb :blog_new 
end

get '/blogs/create' do
     Blog.create(
        title: params[:title],
        content: params[:content], 
        image_url: params[:url],
        tag: params[:tag]
    
    )
    erb :blog_create
end

get '/blogs/show/:id' do
    
    @blog = Blog.get(params[:id])
    erb :blog_show
end

get '/blogs/edit/:id' do
    
    @blog = Blog.get(params[:id])
    erb :blog_edit
end

get '/blogs/destroy/:id' do
    
    
    blog = Blog.get(params[:id])
    blog.destroy
    
    redirect '/blogs'
end

get '/blogs/update/:id' do
    
    blog = Blog.get(params[:id])
    blog.update(
         title: params[:title],
         content: params[:content],
         tag: params[:tag],
         image_url: params[:url]
    )
    
    redirect '/blogs'
end