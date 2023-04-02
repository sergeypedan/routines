# frozen_string_literal: true

class MusclesController < DashboardsController

	def index
		@muscles = Muscle.all.includes(:excercises)
	end


	def show
		@muscle = Muscle.find params[:id]
	end


	def new
		@muscle = Muscle.new
		render :edit
	end


	def edit
		@muscle = find_muscle
	end


	def create
		@muscle = Muscle.new(filtered_params)
		if @muscle.save
			redirect_to muscles_path, notice: "OK"
		else
			render :edit
		end
	end


	def update
		@muscle = find_muscle
		if @muscle.update(filtered_params)
			redirect_to root_path, notice: "OK"
		else
			render :edit
		end
	end


	def destroy
		find_muscle.destroy
		redirect_to muscles_path, notice: "OK"
	end


	private


	def find_muscle
		Muscle.find(params[:id])
	end


	def filtered_params
		params.require(:muscle).permit(:name, :name_en, :id)
	end

end
