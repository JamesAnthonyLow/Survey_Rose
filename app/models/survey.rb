class Survey < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :questions
	has_many :votes
	
	def already_voted?(user)
		votes.map(&:voter).any? {|voter| voter == user}
	end

end

