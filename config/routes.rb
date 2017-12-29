Rails.application.routes.draw do
   
  root "areas#index"
  get "/sign_in" => "sessions#new", as: "sign_in"
  get 'promotions/search' => 'promotions#search'
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  resource :session, controller: "sessions", only: [:create, :new, :destroy ]
  
  resources :promotions
  resources :areas
  resources :partners
  resources :bookings
  resources :users
  resources :area, controller: "areas", only: [:show] do 
    resources :promotions, controller: "promotions", only: [:new, :create]
   end 
   
  resources :area, controller: "areas", only: [:show] do 
    resources :booking, controller: "bookings", only: [:new, :create, :show] do 
       post "checkout" 
    end 
  end 

  resources :user, controller: "users", only: [:show] do 
   resources :point_wallet, controller: "point_wallets", only: [:show]
  end 

   resources :promotions, controller: "promotions", only: [:show] do
      resources :point_wallet, controller: "point_wallets", only: [:show] do 
    resources :purchased_coupon, controller: "purchased_coupons", only: [:create, :new]
      end
    end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
