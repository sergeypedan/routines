# frozen_string_literal: true

class CitiesController < DashboardsController

	KLASS = City

	def index
		@cities = KLASS.all
	end


	def new
		@city = KLASS.new
		render :edit
	end


	def create
		@city = KLASS.new(filtered_params)
		if @city.save
			redirect_to cities_path
		else
			render :edit
		end
	end


	def edit
		set_city
	end


	def update
		set_city
		if @city.update(filtered_params)
			redirect_to cities_path
		else
			render :edit
		end
	end


	def destroy
		set_city
		@city.destroy
		redirect_to cities_path
	end


	private

	def set_city
		@city = KLASS.find params[:id]
	end

	def filtered_params
		params.require(:city).permit(:name_en, :name_ru)
	end

end
