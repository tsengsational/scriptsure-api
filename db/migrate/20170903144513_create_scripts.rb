class CreateScripts < ActiveRecord::Migration[5.1]
  def change
    create_table :scripts do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
