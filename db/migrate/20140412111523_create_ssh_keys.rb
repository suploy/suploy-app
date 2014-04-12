class CreateSshKeys < ActiveRecord::Migration
  def change
    create_table :ssh_keys do |t|
      t.string :title
      t.string :fingerprint
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
