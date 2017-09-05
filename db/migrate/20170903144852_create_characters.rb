class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.string :breakdown
      t.integer :script_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
