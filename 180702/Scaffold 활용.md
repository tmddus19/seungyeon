# Scaffold 활용

- rails g scaffold Post title content == rails g model Post title content

  (migrate, db/post.rb) ->rake db:migrate

- scaffold : 기초를 만들어 준다.

- before_action : 모든 액션이 불리기 직전에 실행하다.(:메소드)

  ex) before_action(:set_post, except: [:index, :new, :create])  

  - exept : 이것만 제외하고
  - only: [ ]   :[ ]안에있는것들만

- primary key : 고유값