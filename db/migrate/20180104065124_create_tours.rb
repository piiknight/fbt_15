class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :address
      t.float :price
      t.datetime :time_to
      t.datetime :time_from
      t.text :tour_info
      t.string :image
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
