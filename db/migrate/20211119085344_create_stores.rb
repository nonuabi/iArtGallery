class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :price
      t.string :size

      t.timestamps
    end
  end
end
