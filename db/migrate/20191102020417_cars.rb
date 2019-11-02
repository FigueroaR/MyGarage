class Cars < ActiveRecord::Migration
  def change
    create_table :Cars do |t|
      t.text :make 
      t.text :model 
      t.text :year
    end
  end
end
