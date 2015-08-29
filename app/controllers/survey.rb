
get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get "/surveys/:id" do
  @survey = Survey.find_by(id: params[:id])
  if !@survey.already_voted_by_user?(session[:user])
    erb :"surveys/show"
  else
    redirect "/surveys/#{@survey.id}/statistics"
  end
end

post "/surveys/:id" do
  survey = Survey.find_by(id: params[:id])
  survey.update_votes(params, session[:user])
  redirect "/surveys/#{params[:id]}/statistics"
end

get "/surveys/:id/statistics" do
  @survey = Survey.find_by(id: params[:id])
  if @survey.user_created_survey?(session[:user])
    @can_edit = true
  end
  erb :"surveys/statistics"
end

get "/surveys/:id/edit" do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

put "/surveys/:id" do
  question = Question.create()
  options.each do |option|

  end
  @survey = Survey.find_by(id: params[:id])
  @survey.questions << question
end

delete "/questions/:id/delete" do
  q = Question.find_by(id: params[:id]).destroy
  redirect "/surveys/#{q.survey.id}/edit"
end

post "/surveys/:survey_id/questions" do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.create(body: params[:question][:body])
  @question.create_options(params[:option])
  @survey.questions << @question
  @count = (@survey.questions.count + 1)
  puts request.xhr?
  redirect "/surveys/#{@survey.id}/questions/new"
end

get "/surveys/:survey_id/questions/new" do
  @user = session[:user]
  @survey= Survey.find_by(id: params[:survey_id])
  @count = (@survey.questions.count + 1)
  erb :'/questions/new', :layout => false if request.xhr?
end
