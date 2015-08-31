get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get "/surveys/:id" do
  unless session[:user]
    flash[:error] = "You must log in to take a survey."
    redirect '/users/login'
  end
  @survey = Survey.find_by(id: params[:id])
  unless @survey.already_voted_by_user?(session[:user])
    erb :"surveys/show"
  else
    redirect "/surveys/#{@survey.id}/statistics"
  end
end

post "/surveys/:id" do
  Survey.find_by(id: params[:id]).update_votes(params, session[:user])
  redirect "/surveys/#{params[:id]}/statistics"
end

get "/surveys/:id/statistics" do
  @survey = Survey.find_by(id: params[:id])
  if @survey && @survey.user_created_survey?(session[:user])
    @can_edit = true
  end
  erb :"surveys/statistics"
end

get "/surveys/:id/edit" do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

post "/surveys/:id/save" do
  redirect "/surveys/#{params[:id]}/statistics"
end
