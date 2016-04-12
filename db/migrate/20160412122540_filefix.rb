class Filefix < ActiveRecord::Migration
  def change
    rename_column :supporting_files, :filename, :file_name
  end
end
