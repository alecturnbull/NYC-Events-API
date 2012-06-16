HacknJill::Application.routes.draw do
  match '/search', :to => "street_events#search"

end
