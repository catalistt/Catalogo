Rails.application.routes.draw do
  resources :payment_methods
  resources :physicals
  resources :digitals
  resources :products

  resources :purchase_orders do
      post 'add_product/:product_id', to: 'purchase_orders#add_product'
  end
 end
