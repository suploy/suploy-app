class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :ip
      t.string :container_id
      t.string :connection_url
      t.string :type
      t.integer :app_id

      t.timestamps
    end
  end
end
