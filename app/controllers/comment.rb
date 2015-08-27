post "/posts/:id/comments" do
  if logged_in?
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new(params[:comment])
    @user = session[:user]
    if @comment.save
      @user.comments << @comment
      @user.save
      @post.comments << @comment
      @post.save
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{@post.id}"
    end
  else
    redirect "/users/login"
  end
end
