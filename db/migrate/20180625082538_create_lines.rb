class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.integer :line_number
      t.integer :time

      t.timestamps
    end
  end
end
