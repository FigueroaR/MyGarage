class Cars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :make 
      t.text :model 
      t.text :year
      t.integer :user_id
    end
  end
end
