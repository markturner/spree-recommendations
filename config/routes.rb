Spree::Core::Engine.routes.draw do
  namespace :admin do 
    resources :products do 
      resources :recommendations do
        collection do
          delete :remove
          post :add
          post :search
        end
      end
    end
  end  
end
