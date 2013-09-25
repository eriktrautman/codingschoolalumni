Codingschoolalumni::Application.routes.draw do

  root "users#new"

  resources :users, :only => [:new, :create]
  get "linkedin_signup" => "users#linkedin_signup"

end
