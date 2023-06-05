# frozen_string_literal: true

class FoodsController < DashboardsController

	before_action :set_food, only: %i[destroy edit update]

	KLASS = Food


	def index
		@labs = KLASS.includes(:city)
	end


	def new
		@lab = KLASS.new
		render :edit
	end


	def create
		@lab = KLASS.new(filtered_params)
		if @lab.save
			redirect_to labs_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @lab.update(filtered_params)
			redirect_to labs_path
		else
			render :edit
		end
	end


	def destroy
		@lab.destroy
		redirect_to labs_path
	end


	private

	def filtered_params
		params.require(:lab).permit(:carbs_in_100_g, :fats_in_100_g, :kcal_in_100_g, :name_en, :name_ru, :protein_in_100_g)
	end


	def set_food
		@lab = KLASS.find params[:id]
	end

end
