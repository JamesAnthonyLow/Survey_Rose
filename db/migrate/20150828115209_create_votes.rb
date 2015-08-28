class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.references :question
  		t.references :option
  		t.references :voter
  		t.references :survey
  		t.timestamps null: false
  	end
  end
end
