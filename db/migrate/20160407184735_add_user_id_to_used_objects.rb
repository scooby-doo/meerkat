class AddUserIdToUsedObjects < ActiveRecord::Migration
  def change
    add_column :used_objects, :user_id, :integer
  end
end
