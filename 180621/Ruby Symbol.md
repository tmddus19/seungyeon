# Ruby Symbol

- 글자 String, Symbol

- 문자열이 아님

- 고유한 저장위치 있어 한번저장되면 중복값을 받지않음, 변경 불가 

- `.object_id` 글자의 id를 보여줌 (string의 경우 저장되는곳이 달라서 id 계속달라짐)  

  변수에 넣으면 특정위치에 저장되어있어서 id가 달라지지 않음 

  symbol은 id가 달라지지 않음  ex) greeting = "hello",  name = :john

- `.to_s` : string을 symbol로 바꿀때

- `.to_sym` : symbol을 string으로 바꿀때

- key 값은 단일값으로 써야함 (symbol로 쓰는게 좋음)

- hash를 만드는 3가지 방법

  - donghyun = {"name"=>"donghyun", "age"=>"27", "gender"=>"male" }
  - hongsuk = {:name => "hongsuk", :age => "27", :gender => "male"}
  - yerim = {name: "yerim", age: "27" ,gender: "female"}
  - jongwon = {"name": "jongwon"} (x)

- class 의 이름은 항상 대문자 ex) class Student

- initialize : 초기화  `.new`는 initialize를 불러옴

- (인스턴스 변수) `attr_reader :name, :age, :gender` 와

  ```
  def name
          @name
      end
  
      def age
          @age
      end
  
      def gender #클래스안에 인스턴스 변수를 가져오는 함수 ==getter
          @gender
      end
  ```

  는 같음

- `attr_writer :name, :age, :gender `은

  ```
   def name=(input) #클래스안에 인스턴스 변수를 설정하는 함수 ==setter
          @name = input
      end
      
      def age=(input) #클래스안에 인스턴스 변수를 설정하는 함수 ==setter
          @age = input
      end
  
      def gender=(input) #클래스안에 인스턴스 변수를 설정하는 함수 ==setter
          @gender = input
      end
  ```

  와 같음

- `attr_accessor :name, :age, :gender `와 

  ```
  attr_reader :name, :age, :gender
  attr_writer :name, :age, :gender
  ```

  는 같음

- `hongsuk = Student.new("홍석", "27", "female")` 에서 잘못쓴것은 `hongsuk.gender= "male"`  바꿀 수 있음

- include : 모듈

- class Student < Person  :상속(Person이 더 큰 개념), 반대로는 적용안됨

- `yell` : 입력한 글자에 느낌표두개 나오는 메소드

