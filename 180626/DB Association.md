# Ruby

- block : 코드의 묶음

  - { }

  - do ... end

    ```
    numbers = [1, 2, 3, 4, 5]
    str_numbers = []
    
    numbers.map! do |num|
        num += 5
    end
    
    puts numbers
    ```

  - ```
    numbers = [1, 2, 3, 4, 5]
    str_numbers = []
    
    numbers.map! {|num| num += 5} 
    
    puts numbers
    ```

- 

- .map : 기본배열을 바꿈

- .each : 다른데로 복사해서 바꿈 항상뒤에 block이 나옴 , yield가 포함되어 있음

# DB Association

- 파일 만드는법 & 지우는법

- ```
  rails g controller postx index new show
  rails d controller postx
  ```

  에러

  1. no route 
  2. missimg 액션 -> controller 에 액션정의
  3. missing template -> views에 erb 파일 생성
  4. 데이터 관련에서는 서버를 꺼야함

- DB를 만드는 법

  `rake db:migrate`

- `rails console`을 콘솔창에 치면 rails환경의 콘솔창을 불러줌

  콘솔창에 ` Post.all`을 치면 썼던 글들이 나옴

  콘솔창에서 글을 쓰고 싶으면 `Post.create(title: "와 콘솔로 써진다", content: "콘솔짱)`

  쓴글을 찾고 싶을때 `Post.find_by(title: "와 첫번째 글이다")`

- 돌아갈 페이지를 쓸때는 `redirect_to '/'`

- show와 edit, update의 post_controller 내용은 같다.

- #{}으로 바꿀수 있는것은 꼭` ""`를 써야한다.`ex) redirect_to "/posts/show/#{@post.id}"`

- 다른곳에도 같은내용이 있는것을 수정하고 싶을땐 views파일의 layout안에 application.erb에서 고쳐야함

- controller이름은 항상 복수

- `User.find(고유한 id값)`

  ex) `User.find(1)`

  ​      `User.find(200)`

  `User.find_by(찾고자하는 필드: 값)`

  ex) `User.find_by(username: "김루비")`

  