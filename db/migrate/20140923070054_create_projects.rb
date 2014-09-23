class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.integer :target_amount, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :category_id 
      t.integer :creator_id, null: false
      t.timestamps
    end
    add_index "projects", ["creator_id"], name: "index_projects_on_creator_id", using: :btree
    add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  end
end
