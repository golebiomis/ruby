class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :surname
      t.integer :phone
      t.string :address
      t.bigint :PESEL
      t.text :description

      t.timestamps null: false
    end
  end
end
