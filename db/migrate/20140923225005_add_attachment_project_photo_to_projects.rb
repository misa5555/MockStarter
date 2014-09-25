class AddAttachmentProjectPhotoToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :project_photo
    end
  end

  def self.down
    drop_attached_file :projects, :project_photo
  end
end
