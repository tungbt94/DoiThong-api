Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
