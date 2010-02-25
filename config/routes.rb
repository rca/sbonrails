ActionController::Routing::Routes.draw do |map|
  map.resources :presentations
  map.resources :likes
  map.resource :session
  map.sign_up 'sign_up', :controller => 'users', :action => 'new'
  map.sign_in 'sign_in', :controller => 'sessions', :action => 'new'
  map.sign_out 'sign_out', :controller => 'sessions', :action => 'destroy', :method => :delete

  Clearance::Routes.draw(map)
  map.root :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

