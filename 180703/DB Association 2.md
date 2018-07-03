# DB Association 2

- 1 : N
- post : content
- `rails g model Post title content`
- `rails g model Comment content post_id:integer`    (post뒤에 아무것도 안쓰면 string)
- `Post has_many :comment`
- `Comment belongs_to :post`
- 

```ruby
get '/' => 'posts#index'  =  root 'posts#index'
```

- `Comment.where(post_id: 1)`콘솔창에 치면 post_id가 1번인 사람의 글을 다 보여준다.





# 영화평점서비스 만들기

### Data Collection

1. API
2. Scraping 
   - data
   - page
3. Crawling

- watcha에서 json파일 받아온다.
- git bash에서 json 파일을 vscode로 연다.



### Data Exhibition