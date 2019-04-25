Rails.application.routes.draw do

	root to: "excercisings#index"

	resources :excercises
	resources :excercisings
	resources :muscles

end
