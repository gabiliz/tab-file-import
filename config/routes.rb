Rails.application.routes.draw do
  root 'file#index'
  resources :file, only: [:index, :create] do 
    collection do 
      get :home
    end
  end
  
end
