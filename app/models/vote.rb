class Vote < ActiveRecord::Base
	belongs_to :question
	belongs_to :option
	belongs_to :voter, class_name: 'User'
	belongs_to :survey
end
