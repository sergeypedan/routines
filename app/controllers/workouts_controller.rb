# frozen_string_literal: true

class WorkoutsController < DashboardsController

	DAYS_PER_PAGE = { desktop: 3, mobile: 1 }

	before_action :set_resource, only: [:destroy, :duplicate, :edit, :update, :yesterday]
	before_action :load_muscles, only: [:new, :edit]

	protect_from_forgery({ except: :index })


	# def dates
	# 	dates_count = DAYS_PER_PAGE.fetch(layout_variant)
	# 	Workout.select(:date).distinct.order(date: :desc).limit(dates_count).pluck(:date)
	# end


	def index
		scope = Workout.includes(excercise: [:main_muscle, :muscles]).order({ date: :desc })
		respond_to do |format|
			format.html do
				@next_page = 2
				@workouts  = scope.where(date: Workout.maximum(:date))
				render :index_mobile if at_mobile?
			end

			format.js do
				current_page       = params[:page].to_i
				render :bad_request and return if current_page.zero?
				current_page_index = current_page - 1
				dates_scoping      = current_page_index..(current_page_index + DAYS_PER_PAGE.fetch(layout_variant) - 1)
				page_dates         = Workout.distinct.order(date: :desc).pluck(:date)[dates_scoping]
				@next_page         = (current_page + 1) if page_dates.any?
				@workouts          = scope.where(date: page_dates)
				render "index_#{layout_variant}.js"
			end
		end
	end


	def new
		@workout = Workout.new(date: Date.today)
		render :edit
	end


	def edit
	end


	def create
		@workout = Workout.new(filtered_params)
		if @workout.save
			redirect_to workouts_path, notice: "Created"
		else
			render :edit
		end
	end


	def update
		if @workout.update(filtered_params)
			redirect_to workouts_path, notice: "Updated"
		else
			render :edit
		end
	end


	def destroy
		@workout.destroy
		redirect_to workouts_path, notice: "Deleted"
	end


	def duplicate
		Workout.create(@workout.attributes.except("id", "created_at", "date", "updated_at").merge({ date: Time.current.to_date }))
		redirect_to workouts_path
	end


	def yesterday
		@workout.update(date: Date.yesterday)
		redirect_to workouts_path
	end


	private


	def set_resource
		@workout = Workout.find params[:id]
	end


	def filtered_params
		params
			.require(:workout)
			.permit(
				:date,
				:excercise_id,
				:repetitions_count,
				:resistance_duration,
				:weight
			)
	end

	def load_muscles
		@muscles = Muscle.includes(:targeted_excercises)
	end

end
