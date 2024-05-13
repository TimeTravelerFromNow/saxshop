class CreateIcons < ActiveRecord::Migration[7.1]
  def change
    create_table :icons do |t|
      t.string :fa_class
      t.string :fa_icon

      t.timestamps
    end
  end
end
