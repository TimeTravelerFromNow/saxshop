class AddYearEstToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :year_est, :string
  end
end
