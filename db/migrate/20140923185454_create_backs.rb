class CreateBacks < ActiveRecord::Migration
  def change
    create_table :backs do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
