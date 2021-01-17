Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/:id/items', to: 'items#index'
      end

      resources :users, only: [:create]
      resources :merchants, only: [:index, :show]
      resources :items
    end
  end
end
