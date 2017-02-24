class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :seq
      t.string :code
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.datetime :login_at
      t.datetime :logout_at
    end
    
    add_index :users, [:email, :code], unique: true
  end
end

