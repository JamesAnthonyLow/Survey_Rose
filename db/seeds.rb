require 'faker'
5.times do
	user_name = Faker::Internet.user_name
	User.create(username: user_name, password: "foo")
end
	10.times do
		survey_name = Faker::App.name
		survey = Survey.create(name: survey_name)
		5.times do
			question = survey.questions.create(body: Faker::Lorem.sentence)
				4.times do
					question.options.create(choice: Faker::Lorem.sentence)
				end
		end
		survey.creator = User.all.sample
		survey.save
	end
