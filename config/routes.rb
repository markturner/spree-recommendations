Spree::Core::Engine.routes.draw do
  namespace :admin do 
   resources :products do 
     resources :recommendations do
       member do
        post :select
        post :remove
       end
       collection do
         post :available
         get :selected
       end
     end
   end
  end  
end
