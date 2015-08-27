class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :user_name
      t.string   :password_hash
      t.references :comments
      t.references :posts

      t.timestamps :null => false
    end
  end
end
