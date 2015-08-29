get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get "/surveys/:id" do
  survey = Survey.find_by(id: params[:id])
  if !survey.already_voted_by_user?(session[:user])
    @survey = Survey.find_by(id: params[:id])
    erb :"surveys/show"
  else
    erb :'/surveys/already_voted'
  end
end

post "/surveys/:id" do
  survey = Survey.find_by(id: params[:id])
  if !survey.already_voted_by_user?(session[:user])
    survey.update_votes(params, session[:user])
    redirect "/surveys/#{params[:id]}/statistics"
  else
    erb :'/surveys/already_voted'
  end
end

get "/surveys/:id/statistics" do
  @survey = Survey.find_by(id: params[:id])
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
  @question = Question.new(body: params[:question][:body])
  if @question.save
    @question.options.create(choice: params[:option][:choice1])
    @question.options.create(choice: params[:option][:choice2])
    @question.options.create(choice: params[:option][:choice3])
    @question.options.create(choice: params[:option][:choice4])
    @survey.questions << @question
    @survey.save
  end
    redirect "/surveys/#{@survey.id}/questions/new"
end

get "/surveys/:survey_id/questions/new" do
  @user = session[:user]
  @survey= Survey.find_by(id: params[:survey_id])
  erb :'/questions/new'
end
