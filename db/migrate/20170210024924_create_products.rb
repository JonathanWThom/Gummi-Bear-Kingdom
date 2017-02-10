class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :cost, :decimal
      t.column :country, :string
      t.column :image, :string

      t.timestamps
    end
  end
end
