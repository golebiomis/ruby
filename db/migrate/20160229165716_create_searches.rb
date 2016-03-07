class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :skill
      t.integer :phone
      t.string :address
      t.text :description
      t.integer :PESEL

      t.timestamps null: false
    end
  end
end
