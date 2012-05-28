class CreateRecommendations < ActiveRecord::Migration
  def change 
    create_table :recommendations, {:id => false} do |t|
      t.references :product
      t.column :recommendation_product_id,     :integer, :null => false
    end
  end
end
