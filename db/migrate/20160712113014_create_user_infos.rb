class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :seq
      t.references :user, index: true, foreign_key: true
      t.string :sex
      t.integer :age
      t.date :birthday
    end
  end
end