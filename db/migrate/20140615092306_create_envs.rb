class CreateEnvs < ActiveRecord::Migration
  def change
    create_table :envs do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
