# frozen_string_literal: true

class MoodsController < DashboardsController

	before_action :assign_mood, only: [:destroy, :edit, :show, :update]


	def index
		@moods = klass.all
	end


	def show
	end


	def new
		@mood = klass.new
		render :edit
	end


	def create
		@mood = klass.new(filtered_params)
		if @mood.save
			redirect_to moods_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @mood.update(filtered_params)
			redirect_to moods_path
		else
			render :edit
		end
	end


	def destroy
		@mood.destroy
		redirect_to moods_path
	end


	private def filtered_params
		params
			.require(:mood)
			.permit(
				:name_en,
				:name_ru
			)
	end


	private def assign_mood
		@mood = klass.find params[:id]
	end


	private def klass
		Mood
	end

end
