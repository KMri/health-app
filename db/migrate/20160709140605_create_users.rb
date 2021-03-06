class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # t.integer :seq
      t.column :seq, 'INTEGER AUTO_INCREMENT'
      t.string :code
      t.string :email
      t.string :password_digest
      t.boolean :is_man
      t.integer :age
      t.date :birthday
      t.boolean :is_admin
      t.datetime :login_at
      t.datetime :logout_at
    end
    
    # execute "ALTER TABLE users ADD AUTO_INCREMENT (seq);"
    add_index :users, [:email, :code], unique: true
  end
end

