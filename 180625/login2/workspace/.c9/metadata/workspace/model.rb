{"filter":false,"title":"model.rb","tooltip":"/model.rb","undoManager":{"mark":2,"position":2,"stack":[[{"start":{"row":0,"column":0},"end":{"row":15,"column":18},"action":"insert","lines":["DataMapper::setup(:default, \"sqlite3://#{Dir.pwd}/login.db\")","","class User","  include DataMapper::Resource","  property :id, Serial","  property :email, String","  property :password, String","  property :created_at, DateTime","end","","# Perform basic sanity checks and initialize all relationships","# Call this when you've defined all your models","DataMapper.finalize","","# automatically create the post table","User.auto_upgrade!"],"id":1}],[{"start":{"row":10,"column":0},"end":{"row":11,"column":47},"action":"remove","lines":["# Perform basic sanity checks and initialize all relationships","# Call this when you've defined all your models"],"id":2}],[{"start":{"row":13,"column":0},"end":{"row":13,"column":37},"action":"remove","lines":["# automatically create the post table"],"id":3},{"start":{"row":12,"column":0},"end":{"row":13,"column":0},"action":"remove","lines":["",""]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":0},"end":{"row":12,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1529886908406,"hash":"104c13da30094cf29421e255c6e49051c209d0d1"}