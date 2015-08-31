require 'spec_helper'
describe Question do 
	context 'associations' do
		it 'should belong to a survey' do
			should belong_to :survey
		end
		it 'should have many options' do
			should have_many :options
		end
	end
end

