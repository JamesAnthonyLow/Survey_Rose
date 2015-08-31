get "/surveys/:survey_id/questions/new" do
  @user = session[:user]
  @survey = Survey.find_by(id: params[:survey_id])
  @count = (@survey.questions.count + 1)
  @question = Question.new(options: Array.new(4){Option.new})
  unless @survey.questions.empty?
    @question = @survey.questions.last 
    erb :"questions/next", layout: false
  else
    erb :"questions/new", locals: {survey: @survey, count: @count, question: @question }, layout: false
  end
end

post "/surveys/:survey_id/questions" do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.create(body: params[:question][:body])
  @question.create_options(params[:option])
  @survey.questions << @question
  @newQuestion = Question.new(options: Array.new(4){Option.new})
  @count = (@survey.questions.count + 1)
  redirect "/surveys/#{@survey.id}/questions/new" unless request.xhr?
  unless @survey.questions.empty?
    @question = @survey.questions.last 
    erb :"questions/next", layout: false
  else
    erb :"questions/new", locals: { survey: @survey, count: @count, question: @newQuestion }, layout: false
  end
end

delete "/questions/:id/delete" do
  q = Question.find_by(id: params[:id]).destroy
  redirect "/surveys/#{q.survey.id}/edit" unless request.xhr?
  erb "<p></p>"
end

get "/questions/:id/edit" do
  @question = Question.find_by(id: params[:id])
  survey = @question.survey
  @count = (survey.questions.index(@question) + 1)
  erb :"questions/edit", locals: { count: @count, question: @question }, layout: false if request.xhr?
end

put "/questions/:id" do
  @question = Question.find_by(id: params[:id])
  @question.body = params[:question][:body]
  @question.options.delete_all
  @question.create_options(params[:option])
  @question.save
  erb :"questions/info", locals: { question: @question, can_edit: true }, layout: false
end