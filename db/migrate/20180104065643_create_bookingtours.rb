class CreateBookingtours < ActiveRecord::Migration[5.1]
  def change
    create_table :bookingtours do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.float :price
      t.string :place_from
      t.string :place_to
      t.integer :quantity
      t.string :state

      t.timestamps
    end
  end
end
