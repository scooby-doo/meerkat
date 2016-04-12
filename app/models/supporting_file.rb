class SupportingFile < ActiveRecord::Base

  belongs_to :owner_to, polymorphic: true
  has_attached_file :file

  validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates_with AttachmentSizeValidator, attributes: :file, less_than: 5.megabytes

end
