class CreateAdminsTutorialsJoin < ActiveRecord::Migration

  def change
    create_table :admins_tutorials, :id => false do |t|
      t.integer "admin_id"
      t.integer "tutorial_id"
    end
    add_index(:admins_tutorials, ["admin_id", "tutorial_id"])
  end

  def down
    drop_table(:admins_tutorials)
  end

end
