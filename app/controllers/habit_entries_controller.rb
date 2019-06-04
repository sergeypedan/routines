# frozen_string_literal: true

class HabitEntriesController < ApplicationController

	def index
		@date    = Date.parse(params[:date]) if /\d{4}-\d{2}-\d{2}/ === params[:date]
		@entries =  if @date
									HabitEntry.where("DATE(created_at) = ?", @date)
								else
									HabitEntry.all
								end
	end

	def new
		@entry = HabitEntry.new
		render :edit
	end

	def create
		@entry = HabitEntry.new(filtered_params)
		respond_to do |format|
			format.html do
				if @entry.save
					redirect_to habit_entries_path
				else
					render :edit
				end
			end

			format.js do
				if @entry.save
					render "create_from_day_habit" if params[:from] == "day_habit"
				else
					render :error
				end
			end
		end
	end

	def edit
		@entry = HabitEntry.find params[:id]
	end

	def update
		@entry = HabitEntry.find params[:id]
		if @entry.update(filtered_params)
			redirect_to habit_entries_path
		else
			render :edit
		end
	end

	def destroy
		HabitEntry.find(params[:id]).destroy
		redirect_to habit_entries_path
	end


	private

	def filtered_params
		params.require(:habit_entry).permit(:id, :habit_id)
	end

end
