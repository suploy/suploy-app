class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :hostname
      t.integer :port
      t.string :username
      t.string :password
      t.integer :app_id

      t.timestamps
    end
  end
end
