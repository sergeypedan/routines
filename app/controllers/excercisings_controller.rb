# frozen_string_literal: true

class ExcercisingsController < DashboardsController

	def index
		@excercisings = Excercising.includes(excercise: :muscles)
																.order({ date: :desc, created_at: :desc })
	end


	def new
		@excercising = Excercising.new(date: Date.today)
		render :edit
	end


	def edit
		@excercising = find_excercising
	end


	def create
		@excercising = Excercising.new(filtered_params)
		if @excercising.save
			redirect_to excercisings_path, notice: "Created"
		else
			render :edit
		end
	end


	def update
		@excercising = find_excercising
		if @excercising.update(filtered_params)
			redirect_to excercisings_path, notice: "Updated"
		else
			render :edit
		end
	end


	def destroy
		find_excercising.destroy
		redirect_to excercisings_path, notice: "Deleted"
	end


	def duplicate
		source_record   = Excercising.find params[:id]
		attributes      = source_record.attributes.except("id", "created_at", "updated_at").merge({ date: Date.today })
		new_record      = Excercising.new(attributes)
		new_record.save
		redirect_to excercisings_path, notice: "Duplicated!"
	end


	private


	def find_excercising
		Excercising.find params[:id]
	end


	def filtered_params
		params
			.require(:excercising)
			.permit(
				:date,
				:excercise_id,
				:repetitions_count,
				:resistance_duration,
				:weight
			)
	end

end
