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

# needs to be fixed
# put "/surveys/:id" do
#   question = Question.create()
#   options.each do |option|

#   end
#   @survey = Survey.find_by(id: params[:id])
#   @survey.questions << question
# end

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
  redirect "/surveys/#{@survey.id}/questions/new" unless request.xhr?
  unless @survey.questions.empty?
    @question = @survey.questions.last 
    erb :"questions/next", layout: false
  else
    erb :"questions/new", locals: {survey: @survey, count: @count }, layout: false
  end
end

get "/surveys/:survey_id/questions/new" do
  @user = session[:user]
  @survey = Survey.find_by(id: params[:survey_id])
  @count = (@survey.questions.count + 1)
  unless @survey.questions.empty?
    @question = @survey.questions.last 
    erb :"questions/next", layout: false
  else
    erb :"questions/new", locals: {survey: @survey, count: @count }, layout: false
  end
end
