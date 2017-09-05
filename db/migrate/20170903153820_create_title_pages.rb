class CreateTitlePages < ActiveRecord::Migration[5.1]
  def change
    create_table :title_pages do |t|
      t.string :title
      t.string :byline
      t.string :address_1
      t.string :address_1
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :notes

      t.timestamps
    end
  end
end
