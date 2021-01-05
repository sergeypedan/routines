Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	root to: "day_habits#index"

	# Area.all.each do |area|
	# 	get "/#{area.path}", controller: "areas", action: area.dashboard_action
	# end

	get "/day_habits/:date", to: "day_habits#show",  as: :day_habit
	get "/day_habits",       to: "day_habits#index", as: :day_habits

	resources :brands
  resources :cities
	resources :drugs
	resources :drug_forms
	resources :drug_intakes do
		post :duplicate, on: :member
	end
	resources :excercises
	resources :habit_entries
	resources :habit_stats
	resources :habits do
		post :move, on: :member
	end
	resources :health_markers
	resources :labs
	resources :measurements
	resources :measurements_groups
	resources :moods
	resources :mood_entries
	resources :muscles
	resources :settings, only: [:index, :edit, :update]
	resources :substances
	resources :workouts do
		post :duplicate, on: :member
		post :yesterday, on: :member
	end


	# Devise

	devise_for :users,
							controllers: { registrations: "registrations" },
							path_names: { sign_in: "login", sign_out: "logout" }

end
