class CreateUsedObjects < ActiveRecord::Migration
  def change
    create_table :used_objects do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
