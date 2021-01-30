Rails.application.routes.draw do
  root to: 'scrape_urls#index'
  resources :scrape_urls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
