# frozen_string_literal: true

class MealsController < DashboardsController

	before_action :set_meal, only: %i[destroy edit update]

	KLASS = Meal


	def index
		@meals = KLASS.includes(:food)
	end


	def new
		@meal = KLASS.new
		render :edit
	end


	def create
		@meal = KLASS.new(filtered_params)
		if @meal.save
			redirect_to labs_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @meal.update(filtered_params)
			redirect_to labs_path
		else
			render :edit
		end
	end


	def destroy
		@meal.destroy
		redirect_to labs_path
	end


	private

	def filtered_params
		params.require(:lab).permit(:id, :weight, :food_id)
	end


	def set_meal
		@meal = KLASS.find params[:id]
	end

end
