Codingschoolalumni::Application.routes.draw do

  root "users#new"

  resources :users, :only => [:new]
  get "linkedin_signup" => "users#linkedin_signup"
  post "validate_user" => "users#validate_signup"
  get "/auth/linkedin/callback" => "users#create"

end
