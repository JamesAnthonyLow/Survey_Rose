class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :options
	has_many :votes
	def create_options(choices)
		choices.values.each do |choice|
			self.options.create(choice: choice)
		end
	end
end
