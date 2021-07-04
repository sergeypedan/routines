# frozen_string_literal: true

class WorkoutsController < DashboardsController

	DAYS_PER_PAGE = { desktop: 3, mobile: 2 }

	before_action :set_resource, only: [:destroy, :duplicate, :edit, :update, :yesterday]
	before_action :load_muscles, only: [:new, :edit]


	def index
		respond_to do |format|
			format.html do
				setup_workouts_and_next_page(current_page: 1)
				render :index_mobile if at_mobile?
			end

			format.js do
				current_page = params[:page].to_i
				render :bad_request and return if current_page.zero?
				setup_workouts_and_next_page(current_page: current_page)
				render "index_#{layout_variant}.js"
			end
		end
	end

	private def setup_workouts_and_next_page(current_page:)
		days_per_page      = DAYS_PER_PAGE.fetch(layout_variant)
		current_page_index = current_page - 1
		dates_scoping      = current_page_index..(current_page_index + days_per_page - 1)
		page_dates         = Workout.distinct.order(date: :desc).pluck(:date)[dates_scoping]
		@next_page         = (current_page + days_per_page) if page_dates.any?
		@workouts          = Workout.where(date: page_dates).includes(excercise: [:main_muscle, :muscles]).order({ date: :desc })
	end


	def new
		@workout = Workout.new(date: Date.today)
		render :edit
	end


	def edit
	end


	def create
		@workout = Workout.new(filtered_params)
		render :edit and return unless @workout.save
		redirect_to workouts_path
	end


	def update
		render :edit and return unless @workout.update(filtered_params)
		redirect_to workouts_path
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
