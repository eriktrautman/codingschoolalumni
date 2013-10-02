Codingschoolalumni::Application.routes.draw do

  root "users#new"

  resources :users, :only => [:new]
  post "validate_user" => "users#validate_signup"
  get "/auth/linkedin/callback" => "users#create"

end
