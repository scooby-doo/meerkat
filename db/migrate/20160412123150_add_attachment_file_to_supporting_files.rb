class AddAttachmentFileToSupportingFiles < ActiveRecord::Migration
  def self.up
    change_table :supporting_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :supporting_files, :file
  end
end
