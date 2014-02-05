KiindlyCom::Application.routes.draw do
  resources :dancers


  root :to => 'campaigns#index'
  match 'popup' => 'campaigns#popup', as: :popup

  resources :pledges, only: [:create, :new]

  match ':affiliate_code' => 'campaigns#index', constraints: AffiliateConstraint.new
  match '*a' => 'campaigns#index'
end
