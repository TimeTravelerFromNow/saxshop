class DropYearAndChangeToIntForInstruments < ActiveRecord::Migration[7.1]
  def change
    remove_column :instruments, :year, :datetime
    add_column :instruments, :year, :integer
  end
end
