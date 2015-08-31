require 'spec_helper'

describe User do
	context 'associations' do
		it 'should have many surveys' do
			should have_many :surveys
		end
		it 'should have many votes' do
			should have_many :votes
		end
	end
end

describe Vote do 
	context 'associations' do
		it 'should belong to a voter' do
			should belong_to :voter
		end
		it 'should belong to a survey' do
			should belong_to :survey
		end
		it 'should belong to a question' do
			should belong_to :question
		end
	end
end

describe Survey do 
	context 'associations' do
		it 'should have many votes' do
			should have_many :votes
		end
		it 'should have many questions' do
			should have_many :questions
		end
	end
end


describe Option do 
	context 'associations' do
		it 'should have many votes' do
			should have_many :votes
		end
	end
end
