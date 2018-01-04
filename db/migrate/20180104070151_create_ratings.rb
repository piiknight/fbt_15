class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :tours, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
