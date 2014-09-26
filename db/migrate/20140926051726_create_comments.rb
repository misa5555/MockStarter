class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :project_id, null: false
      t.timestamps
    end
    add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
    add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  end
end
