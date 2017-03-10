class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.column :seq, 'INTEGER AUTO_INCREMENT'
      t.string :title
      t.text :description
      t.boolean :is_public, default: false

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
