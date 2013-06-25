KiindlyCom::Application.routes.draw do
  root :to => 'campaigns#index'
  match 'popup' => 'campaigns#popup', as: :popup

  resources :pledges, only: [:create, :new]

  match '/thisworks' => 'campaigns#index'
  match ':affiliate_code' => 'campaigns#index', constraints: AffiliateConstraint.new
end
