class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :users, foreign_key: true
      t.references :reviews, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
