class CreateBiologyTutorials < ActiveRecord::Migration

  def up
    create_table :biology_tutorials do |t|
      t.integer "author_id", :null => false
      t.string "title"
      t.string "permalink"
      t.text "content", :null => false
      t.boolean "published", :default => false
      t.timestamps
    end
    add_index("biology_tutorials", "author_id")
    add_index("biology_tutorials", "title")
  end

  def down
    drop_table :biology_tutorials
  end

end
