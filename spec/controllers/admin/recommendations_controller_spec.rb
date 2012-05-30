require 'spec_helper'

describe Spree::Admin::RecommendationsController do
  let!(:product_one) { Spree::Product.create!(name: 'Product #1', permalink: "product-1", price: 100) }
  let!(:product_two) { Spree::Product.create!(name: 'Product #2', permalink: "product-2", price: 100) }
    
  context "#search" do
    it "should find products by name" do
      post :search, product_id: product_one.permalink, q: "Product"      
      assigns[:available_recommendations].count.should == 1
      assigns[:available_recommendations].first.should == product_two
    end

    it "should not return the current product" do
      post :search, product_id: product_one.permalink, q: "Product"      
      assigns[:available_recommendations].should_not include(product_one)
    end

    it "should find products by sku" do
      product_two.sku = "PRD2-SKU"
      product_two.save
      post :search, product_id: product_one.permalink, q: "PRD2-"
      assigns[:available_recommendations].count.should == 1
      assigns[:available_recommendations].first.should == product_two
    end

    it "should not return already recommended products" do
      recommendation = product_one.recommendations.new
      recommendation.recommended_product_id = product_two.id
      recommendation.save
      post :search, product_id: product_one.permalink, q: "Product"      
      assigns[:available_recommendations].count.should == 0
    end
  end

  context "#add" do
    it "should add a new recommendation to a product" do
      product_one.recommendations.count.should == 0
      post :add, product_id: product_one.permalink, recommended_id: product_two.id
      product_one.reload
      product_one.recommendations.count.should == 1
    end
  end
end
