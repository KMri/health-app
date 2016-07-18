class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :dkind, index: true, foreign_key: true
      t.integer :val
      t.datetime :record_date

      t.timestamps null: false
    end
  end
end
