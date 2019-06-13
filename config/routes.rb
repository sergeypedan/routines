Rails.application.routes.draw do

	root to: "day_habits#index"

	get "/day_habits/:date", to: "day_habits#show",  as: :day_habit
	get "/day_habits",       to: "day_habits#index", as: :day_habits

	resources :excercises
	resources :excercisings
	resources :habit_entries
	resources :habit_stats
	resources :habits do
		post :move, on: :member
	end
	resources :muscles
	resources :settings, only: [:index, :edit, :update]


	# Devise

	devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }

end
