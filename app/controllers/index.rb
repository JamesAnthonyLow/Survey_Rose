get '/' do
  @post = Post.all
  erb :'/index'
end


