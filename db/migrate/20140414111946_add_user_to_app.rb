class AddUserToApp < ActiveRecord::Migration
  def change
    add_column :apps, :user_id, :integer
  end
end
