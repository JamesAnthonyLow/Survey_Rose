get "/surveys" do
  erb :"surveys/index"
end
get "/surveys/:id" do
  @question = Question.new
  erb :"surveys/show"
end
post "/surveys/:id" do
  "add question votes to survey"
  redirect "/surveys/#{params[:id]}"
end
get "/surveys/:id/statistics" do
  erb :"surveys/statistics"
end
