class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code, index: true, unique: true
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
