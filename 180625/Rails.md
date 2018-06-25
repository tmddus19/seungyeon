특정한 데이터를 쓸 경우 get 아닌 post

get쓸 경우 정보 유출 ex) `post '/register' do`,` <form action="/register" method="post">`

get 사용 : https://login2-tmddus19.c9users.io/register?email=asdf%40asdf.com&password=asdf

post 사용: https://login2-tmddus19.c9users.io/register



# Rails

- MVC (Model 데이터를 관리 View 사용자가 보는 화면 Controller 중간 관리자)
- 요청을 하면 controller -> model -> view 순
- 컨트롤러 만드는 명령어 : rails generate controller 컨트롤할 액션
- render 'home/index' 와 erb :index가 비슷
- route -> controller -> view파일 순



## rails 약속

0.render을 위해 render함수가 호출 될 경우 

- erb파일이 '컨트롤러/액션.erb'일 경우 생략 가능

- 액션의 이름과 erb 이름을 항상 같게 해줘야함

  

1.routes .rb

- 'controller/action' 자동으로 'controller#action'으로 연결해줌 

  ex) get '/lotto' => 'home#lotto'   =>'/home/lotto'



- 많은 데이터를 넣고싶으면 seeds.rb에서 반복문을 넣어서 만들면됨

- gem 'faker'를 추가하면 가짜데이터를 만들어줌

- :: ->모듈

  