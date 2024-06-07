class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :manafacturer
      t.string :model_type
      t.string :serial_no
      t.string :condition
      t.integer :year
      t.string :year_est
      t.integer :price
      t.text :details

      t.timestamps
    end
  end
end
