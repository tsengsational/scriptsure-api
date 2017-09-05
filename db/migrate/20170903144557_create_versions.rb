class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.integer :script_id
      t.string :contentState

      t.timestamps
    end
  end
end
