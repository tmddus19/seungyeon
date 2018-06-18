# 아침과제 (게시판 만들기)

- model.rb란 파일을 만들어서 DB파일을 옮김

- app.rb에 require 'model'이라고 쓰면 model.rb에 있는내용을 가져옴   .rb는 안붙여도됨

- M(model.rb -> DB) V(views -> 사용자 보는내용) C(controller(app.rb))

- <p>테그를 <table>로 바꾸기

  ```
  <table>
      <tr>
          <th>ID</th>
          <th>제목</th>
          <th>작성일자</th>
      </tr>
      
      <% @posts.each do |p| %>
      <tr>
          <td><%= p.id %></td>
          <td> <a href="/show/<%= p.id %>"><%= p.title %></a></td>
          <td><%= p.created_at %></td>
      </tr>
      <% end %>
  
  </table>
  ```

  

- Post.all(1)  =>데이터베이스의 첫번째값을 보여줌

- get '/show/1' do  get'/show/2/ do처럼  하나로 뒤에 숫자 바꾸게하기

  ```
  get '/show/:id' do
      @post = Post.get(params[:id])
      erb :show
  end
  ```

  

- show.erb를 만들어

  ```
  <p>ID : <%= @post.id%></p>
  <p>제목 : <%= @post.title%></p>
  <p>내용 : <%= @post.content%></p>
  <p>작성일자 : <%= @post.created_at%></p>
  
  <a href="/destroy/<%= @post.id %>">삭제</a>
  ```

  

- 
  ​    

  ```
  get '/destroy/:id' do
      
      post = Post.get(params[:id])       @post라고 안하는 이유는 지워진걸 안보여줘도 되기때문이다.
      post.destroy    
      
      redirect '/'
  end
  ```

  

- <input value>에서 value는 뒤에 입력

  <input placeholder>에서 placeholder는 지워지고 써짐