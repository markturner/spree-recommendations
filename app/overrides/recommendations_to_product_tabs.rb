Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "recommendations_to_product_tabs",
                     :insert_bottom => "[data-hook='admin_product_tabs']",
                     :partial => "spree/admin/recommendations/recommendations_link"
                    )
