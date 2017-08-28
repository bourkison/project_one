class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :username
      t.text :firstname
      t.text :lastname
      t.text :email
      t.date :dob
      t.text :password_digest

      t.timestamps
    end
  end
end
