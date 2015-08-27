get '/posts/new' do
  @post = Post.new
  @user = session[:user]
  erb :'/posts/new'
end

get '/posts/:id' do

  @post = Post.find_by(id: params[:id])
  @comments = @post.comments
  @comment = Comment.new
  erb :'/posts/show'
end


post '/posts' do
  @post = Post.new(params[:post])
  @user = session[:user]
  if @post.save
    @user.posts << @post
    @user.save
    redirect '/'
  else
    redirect '/posts/new'
  end
end

