#### Login
post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user
    redirect "/users/#{session[:user][:id]}"
  else
    redirect 'users/login'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if User.auth(@user.username, params[:user][:password])
    session[:user] = @user
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
    erb :'users/login'
  end
end

get '/users/:id/logout' do
  session.clear
  redirect '/'
end

#### CRUD

get "/users/:id/surveys/new" do
  @user = session[:user]
  erb :"/surveys/new"
end

post "/users/:id/surveys" do
  @user = session[:user]
  @survey = Survey.new(params[:survey])
  if @survey.save
    @user.surveys << @survey
    @user.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    redirect "/users/#{@user.id}/surveys/new"
  end
end

