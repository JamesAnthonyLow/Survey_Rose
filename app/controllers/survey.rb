get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get "/surveys/:id" do
  @survey = Survey.find_by(id: params[:id])
  erb :"surveys/show"
end

post "/surveys/:id" do
  survey = Survey.find_by(id: params[:id])
  survey.update_votes(params)
  redirect "/surveys"
end

get "/surveys/:id/statistics" do
  erb :"surveys/statistics"
end
