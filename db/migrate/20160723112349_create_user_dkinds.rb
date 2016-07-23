class CreateUserDkinds < ActiveRecord::Migration
  def change
    create_table :user_dkinds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :dkind, index: true, foreign_key: true
      t.float :target

      t.timestamps null: false
    end
  end
end
