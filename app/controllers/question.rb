 # question_collection = @questions.each_with_object({}) do |question, body|
 #      body[question.body] = question.options.each_with_object({}) do |option, count| 
 #            count[option.choice] = option.votes.count
 #      end
 #  end 

 get "/questions/:id/info" do
  @question = Question.find_by(id: params[:id])
  erb :"/questions/info"
end