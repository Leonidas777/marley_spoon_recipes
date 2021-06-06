Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'recipes#index'

  get 'recipes', to: 'recipes#index'
  get 'recipe', to: 'recipes#show'

  match '/400' => 'errors#page_400', via: :all
  match '/401' => 'errors#page_401', via: :all
  match '/403' => 'errors#page_403', via: :all
  match '/404' => 'errors#page_404', via: :all
  match '/429' => 'errors#page_429', via: :all
  match '/500' => 'errors#page_500', via: :all
end
