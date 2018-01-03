class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :sdt
      t.string :email
      t.string :password_digest
      t.boolean :role, default: false
      t.string :avatar

      t.timestamps
    end
  end
end
