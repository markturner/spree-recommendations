Spree::Core::Engine.routes.draw do
  namespace :admin do 
    resources :products do 
      resources :recommendations do
        collection do
          delete :remove
          post :select
          post :available
          get :selected
        end
      end
    end
  end  
end
