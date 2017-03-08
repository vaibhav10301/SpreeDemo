class CreatePriceDemos < ActiveRecord::Migration
  def change
    create_table :price_demos do |t|
      t.integer :variant_id
      t.decimal :amount, :precision => 10, :scale => 2
      t.string :currency

      t.timestamps null: false
    end
  end
end
