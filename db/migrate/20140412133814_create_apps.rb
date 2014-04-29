class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :status
      t.integer :user_id

      t.timestamps
    end

    add_index :apps, :name, :unique => true
  end
end
