# This migration comes from spree_erp_price_integration (originally 20170309062918)
class CreateErpPriceIntegrations < ActiveRecord::Migration
  def change
    create_table :spree_erp_price_integrations do |t|
    	t.string :name, null: false
      t.string :url, null: false
      t.boolean :selected, default: false
      t.text :token, null: false

      t.timestamps null: false
    end
  end
end
