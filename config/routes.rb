Rails.application.routes.draw do

  root to: "excercisings#index"

  get "/day_habits/:date", to: "day_habits#show",  as: :day_habit
  get "/day_habits",       to: "day_habits#index", as: :day_habits

  resources :excercises
  resources :excercisings
  resources :habit_entries
  resources :habits
  resources :muscles

end
