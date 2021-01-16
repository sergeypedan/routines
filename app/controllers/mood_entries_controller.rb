# frozen_string_literal: true

class MoodEntriesController < DashboardsController

	before_action :assign_mood, only: [:destroy, :edit, :show, :update]


	def index
		@mood_entries = klass.includes(:mood).order(created_at: :desc)
		render :index_mobile if at_mobile?
	end


	def show
	end


	def new
		@mood_entry = klass.new
		render :edit
	end


	def create
		@mood_entry = klass.new(filtered_params.merge({ user_id: current_user.id }))
		if @mood_entry.save
			redirect_to mood_entries_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @mood_entry.update(filtered_params)
			redirect_to mood_entries_path
		else
			render :edit
		end
	end


	def destroy
		@mood_entry.destroy
		redirect_to mood_entries_path
	end


	private def filtered_params
		params.require(:mood_entry).permit(:comment, :mood_id, :user_id, :why)
	end


	private def assign_mood
		@mood_entry = klass.find params[:id]
	end


	private def klass
		MoodEntry
	end

end
