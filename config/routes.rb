Rails.application.routes.draw do



  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'admin#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end





get '/admin', to: "admin#index"


   namespace :admin do
     #pracownicy
     #umiejetnosc

     resources :skills
     resources :employers
   end

end
