class AddColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    remove_column :projects, :start_date, :date
  end
end
