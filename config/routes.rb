Rails.application.routes.draw do

	root to: "day_habits#index"

	["habits", "medicine", "spirit", "workout"].each do |area|
		get "/#{area}", controller: "dashboards", action: area
	end

	get "/day_habits/:date", to: "day_habits#show",  as: :day_habit
	get "/day_habits",       to: "day_habits#index", as: :day_habits

	resources :drugs
	resources :drug_active_substances
	resources :drug_forms
	resources :excercises
	resources :excercisings
	resources :habit_entries
	resources :habit_stats
	resources :habits do
		post :move, on: :member
	end
	resources :moods
	resources :mood_entries
	resources :muscles
	resources :settings, only: [:index, :edit, :update]


	# Devise

	devise_for :users,
							controllers: { registrations: "registrations" },
							path_names: { sign_in: "login", sign_out: "logout" }

end
