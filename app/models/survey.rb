class Survey < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :questions
	has_many :votes

	def already_voted_by_user?(user)
		votes.map(&:voter_id).any? {|voter| voter == user.id} unless !user
	end

  def user_created_survey?(user)
    creator == user
  end

  def update_votes(params={}, session_user)
    self.questions.each do |question|
      voter_choice_id = params["#{question.id}"]
      new_vote = question.votes.new(survey_id: self.id, voter: session_user)
      new_vote.option = Option.find_by(id: voter_choice_id)
      new_vote.save
    end
  end
end

