class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :article, index: true, foreign_key: true
      t.column :seq, 'INTEGER AUTO_INCREMENT'
      t.string :name
      t.string :file

      t.timestamps null: false
    end
  end
end
