class CreatePhysicsTutorials < ActiveRecord::Migration
    
  def up
    create_table :physics_tutorials do |t|
      t.integer "author_id", :null => false
      t.string "title"
      t.string "permalink"
      t.text "content"
      t.boolean "published", :default => false
      t.timestamps
    end
    add_index("physics_tutorials", "author_id")
    add_index("physics_tutorials", "title")
  end

  def down
    drop_table :physics_tutorials
  end


end
