Rails.application.routes.draw do
  # Read all
  get "/restaurants", to: "restaurants#index"
  
  # Create (new needs to be before show, two HTTP Requests)
  get "/restaurants/new", to: "restaurants#new"   # gets the form
  post "/restaurants", to: "restaurants#create" # post (creating id)
  
  # Read one                                      👇 Custom Prefix (do rails routes to see the prefix)
  get "/restaurants/:id", to: "restaurants#show", as: :restaurant
  
  # Update (two HTTP Requests)
  get "/restaurants/:id/edit", to: "restaurants#edit" # gets filled in form
  patch "/restaurants/:id", to: "restaurants#update" #saves it

  # Delete
  delete "/restaurants/:id", to: "restaurants#destroy"
  
  # DO NOT USE TODAY, ONLY AFTER YOU CREATED ALL THE CUSTOM ROUTES
  # resources :restaurants, only: [:new, :create]
  # resources :restaurants, except: [:new, :create]
end
