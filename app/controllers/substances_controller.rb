# frozen_string_literal: true

class SubstancesController < DashboardsController

	def index
		@substances = klass.all
	end


	def show
		@substance = klass.find params[:id]
	end


	def new
		@substance = klass.new
		render :edit
	end


	def create
		@substance = klass.new(filtered_params)
		if @substance.save
			redirect_to substances_path
		else
			render :edit
		end
	end


	def edit
		@substance = klass.find params[:id]
	end


	def update
		@substance = klass.find params[:id]
		if @substance.update(filtered_params)
			redirect_to substances_path
		else
			render :edit
		end
	end


	def destroy
		klass.find(params[:id]).destroy
	end


	private def klass
		Substance
	end


	private def filtered_params
		params
			.require(:substance)
			.permit(
				:daily_dosage,
        :dosage_unit,
				:main_function,
				:name
			)
	end

end
