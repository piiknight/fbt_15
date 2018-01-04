class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :users, foreign_key: true
      t.references :tours, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
