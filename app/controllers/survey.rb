get "/surveys" do
  "show all surveys"
end
get "/surveys/:id" do
  "show survey with all questions iterated in partials"
end
post "/surveys/:id" do
  "add question votes to survey"
end
get "/surveys/:id/statistics" do
  "get survey statistics"
end
