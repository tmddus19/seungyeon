# Twitter 만들기

- 기본적인 Gemfile, model.rb , app.rb, index.erb, layout.erb 파일을 만들어줌

- 회원가입 창 만들기

- 로그인 창 만들기

  - DB에 있는 사람인지 판단
  - DB에 있는 사람이라면 pw가 동일한지 판단 후 권한줌

- model.rb 에 추가

  ```
  class User
      include DataMapper::Resource
      property :id, Serial  # 공통
      property :email, String
      property :password, Sting
      property :created_at, DateTime
  end
  
  User.auto_upgrade!
  ```

  

- signup.erb를 만들어줌

  ```
  <h1>회원가입</h1>
  <form action="/register">
      이메일 : <input type="email" name="email"><br>
      비밀번호 : <input type="password" name="password"><br>
      <input type="submit">
  </form>
  ```

  - input type을 password로 하면 pw 친게 가려짐

- session:  특정고객이 인증을 받았을 때 DB에 저장된것과 같으면 저장되는곳

- @user = User.all(email: params[:email])  DB내에서 찾는코드      .all은 배열로 리턴   .first은 첫번째값만

- 로그인

  ```
    enable :sessions
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
  ```

  

- 로그아웃

  `session.clear`  .clear가 로그인 정보를 없애줌

- <input type="hidden" value="<%= session[:email]%>">   방금 로그인한 이메일은 보이지만 이름쓰는칸은 숨겨져서 안보임 