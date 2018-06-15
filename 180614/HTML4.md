### 악취코드 바꾸기

- ​    @sm = 0
      @sj = 0
      @cy = 0
      @sh = 0
      @yj = 0
      

  ```
  File.open("vote.txt", "r") do |f|
      f.each_line do |l|
          puts l
      end
  end
  ```

-     @result = {
          "sm" => 0,
          "sj" => 0,
          "cy" => 0,
          "sh" => 0,
          "yj" => 0
      }
      
      File.open("vote.txt", "r") do |f|
          f.each_line do |l|
               @result[l.chomp] +=1                           
          end                                    
      end



# 기본 골격 만들기

- app.rb에

  require 'sinatra'

  get '/' do
      erb :index
  end

  get '/1' do
      erb :page1
  end

  get '/2' do
      erb :page2
  end

  get '/3' do
      erb :page3
  end

- index.erb에

  <p>이건 루트 페이지</p>

- page1.erb에

  <p>1번 페이지</p>

- page2.erb에

  <p>2번 페이지</p>

- page3.erb에

  <p>3번 페이지</p>

- layout.erb 를 만든다.

  <!DOCTYPE html>
  <html>
      <head>
          <title> </title>
          <meta charset="utf-8">
      </head>
      <body>
          <h1>이건 레이아웃입니다.</h1>
          <%= yield %>                   :제일 중요 여기 부분만 다르게 사용할 수 있음.
      </body>
  </html>



### 더 괜찮은 투표 서비스 만들기

- `app.rb`에

  require 'sinatra'

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
      
          CSV.foreach("vote.csv") do |row|
             @yes += row[1].to_i
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
  ​    erb :result

  end

- `index.erb`에

  <h1>홍석 반장으로 적합한가?</h1>
  <form action="/vote">
     이름 : <input type="text" name="name">
     <p>찬반 투표</p>
      <input type="radio" name="pro" value="yes">찬성
      <input type="radio" name="pro" value="no">반대
      <input type="submit">
  </form>

- `layout.erb`에

  <!DOCTYPE html>
  <html>
      <head>
          <title> </title>
          <meta charset="utf-8">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
      </head>
      <body>
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Disabled</a>
                </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
          </nav>
      
          <%= yield %>
          
           <footer class="footer">
            <div class="container">
              <span class="text-muted">김홍석 재신임 추진위원회</span>
            </div>
          </footer>
          
      </body>
  </html>

- `vote.erb`에

  <p><%= @name %>님이 홍석님을 몰아내는데 <%= @pro%>하셨습니다.</p>

- `result.erb`에

  <h1>투표 결과</h1>
  <p><%= @yes %>명이 홍석님 추방에 찬성하셨습니다.</p>
  <p>총 <%= @total %>명이 투표에 참가하셨습니다.</p>

  <% if @yes.to_f / @total > 0.5 %>
  <%= "님 제주에 계셈, 영원히" %>
  <% else %>
  <%= "사랑해요, 돌아와요 BJ" %>
  <% end %>

  

  <% @cheers.each do |x| %>
  <p> 이름 : <%= x[0] %> </p>
  <p> 응원의 말 : <%= x[1] %> </p>

  <% end %>

- `cheer.erb`에

  <form action="/write">
      이름 : <input type="text" name="name">
      응원의 말:<input type="text"name="msg">
      <input type="submit">
  </form>

- write.erb에

  <h1>글이 작성되었습니다.</h1>
  <p>이름 : <%= @name %></p>
  <p>응원의 말 : <%= @msg %></p>

- csv파일로 작성한 것은 exel로 열 수 있음. 

  ex) 이름, 찬반

  ​       xx, 1

  ​       yy, 0

  ​      v << ["yerim",1]  :  << 는 push같은 기능

- `gem install sinatra-contrib`를 하게되면

  reload를 직접안해도 됨.

​       require 'sinatra'

​       require 'sinatra/reloader 를 써야함.



# board 만들기

- `bundler`설치

  - gem install bundler를 깐 후

  - Gemfile을 만들어서

    source 'https://rubygems.org'
    gem 'sinatra'
    gem 'sinatra/reloader'

    gem 'json' ,  '<= 1.9'
    gem 'data_mapper'
    gem 'dm-sqlite-adapter'을 씀.

- 밑에 창에 bundle을 치면 Gemfile에 썼던 gem들이 깔림.

- bundle을 깔고 앱을 돌릴려면

  `bundle exec ruby app.rb -o $IP`라고 쳐야함.

- post.create(                                                           CSV.open('board.csv', 'a+') do |csv|
        title: @title,                                  =>                    csv << [@title, @content]****
        body: @content                                              end
        )

  둘이 비슷한 코드

- database 는 table(database의 하위폴더, 표)로 이루어져 있음.

- schema : 어떻게 무엇을 저장할지

- Serial : 연속된숫자

- created_at : 만들어진 시간

- class ~ end :  table을 만들겠다는  뜻

  ex)class Member
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    property :major, String
    property :year, String
    property :phone_number, String
    property :email, String
    property :created_at, DateTime
  end

- DataMapper.finalize :schema에 쓴걸 table로 만들어달라는 뜻

- Post.auto_upgrade! : 글을 계속 쓸 수 있음

- @posts = Post.all : Post에 있는 내용을 모두 뽑겠다는 뜻