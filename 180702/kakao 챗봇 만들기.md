# kakao 챗봇 만들기

- 카카오플러스 친구에 들어와서 API형으로 선택

- API Document는 github 카카오 플러스 친구에가도 볼 수 있다.

- c9에서 새로운 workspace를 만든다.

- `rails g controller home keyboard` 로 home controller를 만들어준다.

  ```ruby
  class HomeController < ApplicationController
    def keyboard
      @keyboard = {
        :type => "buttons",
        :buttons => ["선택 1", "선택 2", "선택 3"]
      }
      render json: @keyboard
      
    end
  end
  ```

  

- 플러스친구 API는 URL요청이 정해져 있으므로 라우팅을 해준다.

  ```ruby
  get 'home/keyboard'   ->   get '/keyboard' => 'home#keyboard'
  ```

  

- 플러스친구 홈페이지로 돌아가서 API테스트를 한다.

  ![1530236106238](C:\Users\student\AppData\Local\Temp\1530236106238.png)



- 테스트완료후 저장하고 관리에들어간다.(스마트 채팅창에서 시작하기버튼을 꼭 눌러야 한다.)

  ![1530236471375](C:\Users\student\AppData\Local\Temp\1530236471375.png)



- route.rb파일에 `post '/message' => '/home#message'`를 추가한다.

- home controller에 

  ```ruby
   def message
      @user_msg = params[:content]
      
      @basic_keyboard = {
        :type => "buttons",
        :buttons => ["로또", "점심메뉴", "고양이"]
      }
      
      @basic_msg = {
        :text => @user_msg
      }
      
      @result = {
        :message => @basic_msg,
        :keyboard => @basic_keyboard
      }
      
      render json: @result
    end
  ```

  크게 @basic_keyboard와 @basic_msg로 나누어져 있고, @result에 저장한것이다.



- application controller에들어가서` protect_from_forgery with: :exception`부분을 주석처리해준다.

- 레일즈가 XML문서를 사용하지 못하기때문에 nokogiri를 사용해준다.

  ```ruby
    def message
      @user_msg = params[:content]
      @return_msg = "기본대답"
      @url = "http://thecatapi.com/api/images/get?format=xml&type=jpg"
      
      if @user_msg == "로또"
        @return_msg = (1..45).to_a.sample(6).sort.to_s
      elsif @user_msg == "점심메뉴"
        @return_msg = ["20층","급식","멀캠식당","구내식당"].sample
      elsif @user_msg == "고양이"
        @cat_xml = RestClient.get(@url)
        @cat_doc = Nokogiri::XML(@cat_xml)
        @cat_url = @cat_doc.xpath("//url").text
  
          
      end
      
      @basic_keyboard = {
          :type => "buttons",
          :buttons => ["로또", "점심메뉴", "고양이"]
      }
      #고양이가 아닐 때
      @basic_msg = {
        :text => @return_msg
      }
      #사진이 포함될 때
      @photo_msg = {
        :text =>"나만 고양이 없어 :(",
        :photo => {
          :url =>@cat_url,
          :width =>720,
          :height =>630
        }
      }
      
      if @user_msg == "고양이"
        @result = {
          :message => @photo_msg,
          :keyboard => @basic_keyboard
        }
      else
        @result = {
        :message => @basic_msg,
        :keyboard => @basic_keyboard
        }
      end
      
      
      render json: @result
    end
  ```

  

- 사진을 넣을때는 url, width, height를 꼭 정의해야한다.

  ```ruby
   @photo_msg = {
        :text =>"나만 고양이 없어 :(",
        :photo => {
          :url =>@cat_url,
          :width =>720,
          :height =>630
        }
      }
  ```

  

- ㄴㅇㅇ

  ```ruby
  -result(json) 
      :message(json) =>
      	-text : value
      	-photo(json)
      		-url : value
      		-width : value
      		-height : value
      -keyboard(json)
      	-type : value
      	-buttons : Array[string]
  ```

  ```ruby
   @result(json) = { 
      :message(json) => {
      	:text => "전달할내용"
      	:photo => {
      		:url => "http://www.adfs.jpg",
      		:width => 760,
      		:height => 630
      		}
      	}
      -keyboard(json)
      	-type : value
      	-buttons : Array[string]
  ```

  ```ruby
  -result(json)     
  	-message(json)        
  		-text : value
  -keyboard(json)    
  	-type : value    
  	-buttons : Array[string]
  ```

  

- HEROKU에 올리기

- gem파일 수정

  ```ruby
  # 변경전
  #gem 'sqlite3'
  # 변경후
  gem 'sqlite3', :group => :development
  gem 'pg', :group => :production
  gem 'rails_12factor', :group => :production
  ```

  ```
  RAILS_EW=production bundle exec rake assets:precomile
  ```

  

- 

- heroku 가입하고 올리기

  `git init`

  `git add .`

  `git commit -m "kakao_chatbot"`

  `heroku login`

  `heroku create` + 원하는 앞주소 (새로운 레퍼지토리만드는 거와 같음)

  `git push heroku master`