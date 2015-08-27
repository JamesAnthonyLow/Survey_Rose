
post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user
    redirect "/users/#{session[:user][:id]}"
  else
    redirect 'users/register'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  if User.auth(params[:user][:user_name], params[:user][:password])
    session[:user] = User.find_by(user_name: params[:user][:user_name])
    redirect "/users/#{session[:user][:id]}"
  else
    redirect 'users/login'
  end
end

get '/users/:id' do
 if session[:user]
    @user = User.find_by(id: session[:user][:id])
    erb :'/users/index'
  else
    erb :'users/access_denied'
  end
end

get '/users/:id/logout' do
  session.clear
  redirect '/'
end

get "/users/:id/posts" do
  @user = User.find_by(id: params[:id])
  erb :"/users/posts"
end

get "/users/:id/comments" do
  @user = User.find_by(id: params[:id])
  erb :"/users/comments"
end
