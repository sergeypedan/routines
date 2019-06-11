# frozen_string_literal: true

class HabitEntriesController < DashboardsController

	def index
		@date    = Date.parse(params[:date]) if /\d{4}-\d{2}-\d{2}/ === params[:date]
		relation = HabitEntry.includes(:habit).order(created_at: :desc)
		@entries =  if @date
									relation.where("DATE(created_at) = ?", @date)
								else
									relation
								end
	end

	def new
		@entry = HabitEntry.new(created_at: Time.current, habit: Habit.find_by(id: params[:habit_id]))

		if /\d{4}-\d{2}-\d{2}/ === params[:date]
			date = Date.parse(params[:date])
			@entry.created_at = Time.current.change(day: date.day, month: date.month, year: date.year)
		end

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
          @day_habit = DayHabit.new(date: @entry.created_at, habit: @entry.habit)
					render "update_day_habit_tr" if params[:from] == "day_habit"
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
		entry = HabitEntry.find(params[:id])
    date  = entry.created_at  # for JS action
    habit = entry.habit       # for JS action
    entry.destroy

    respond_to do |format|
      format.html do
    		redirect_to habit_entries_path
      end
      format.js do
        @day_habit = DayHabit.new(date: date, habit: habit)
        render "update_day_habit_tr" if params[:from] == "day_habit"
      end
    end
	end


	private

	def filtered_params
		params.require(:habit_entry).permit(:created_at, :id, :habit_id, :time, :user_id)
	end

end
