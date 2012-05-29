class CreateRecommendations < ActiveRecord::Migration
  def change 
    create_table :spree_recommendations do |t|
      t.references :product
      t.column :recommended_product_id,     :integer, :null => false
    end
  end
end
