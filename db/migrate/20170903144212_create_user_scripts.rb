class CreateUserScripts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_scripts do |t|
      t.integer :user_id
      t.integer :script_id

      t.timestamps
    end
  end
end
