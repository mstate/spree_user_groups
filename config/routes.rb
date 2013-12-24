Spree::Core::Engine.append_routes do
  namespace :admin do
    resources :user_groups
  end
  get '/admin/user_groups/:id/pricing' => 'admin/user_groups#pricing', :as => 'user_group'
end
