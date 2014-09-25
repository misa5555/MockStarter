class AddTagToProject < ActiveRecord::Migration
  def change
    add_column :projects, :tag_id, :integer
  end
end
