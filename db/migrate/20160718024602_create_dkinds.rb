class CreateDkinds < ActiveRecord::Migration
  def change
    create_table :dkinds do |t|
      t.integer :seq
      t.integer :code
      t.string :jp
      t.string :en
      t.string :unit
    end
  end
end
