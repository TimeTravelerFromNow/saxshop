class AddMakeToInstrument < ActiveRecord::Migration[7.1]
  def change
    add_reference :instruments, :make, null: true, foreign_key: true
  end
end
