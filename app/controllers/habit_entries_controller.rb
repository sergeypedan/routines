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
		@entry            = HabitEntry.new
		@entry.created_at = update_date_in_datetime(Time.current)
		@entry.habit      = Habit.find_by(id: params[:habit_id])
		render :edit
	end


	def create
		respond_to do |format|
			format.html do create_from_html end
			format.js   do create_from_js   end
		end
	end


	def create_from_html
		@entry            = HabitEntry.new filtered_params
		@entry.created_at = update_date_in_datetime(Time.current)
		@entry.user       = current_user

		if @entry.save
			redirect_to habit_entries_path
		else
			render :edit
		end
	end


	def create_from_js
		habit             = Habit.find params.dig(:habit_entry, :habit_id)
		@entry            = HabitEntry.new filtered_params
		@entry.created_at = update_date_in_datetime(Time.current)
		@entry.time       = habit.duration.in(:seconds) if habit.time_based?
		@entry.user       = current_user

		if @entry.save
      @day_habit = DayHabit.new(date: @entry.created_at, habit: @entry.habit)
			render :update_day_habit_tr, locals: { change: :increment }
		else
			render :error
		end
	end


	def edit
		@entry = HabitEntry.find params[:id]
	end


	def update
		@entry            = HabitEntry.find params[:id]
		@entry.created_at = update_date_in_datetime(@entry.created_at)

		if @entry.update(filtered_params)
			redirect_to habit_entries_path
		else
			render :edit
		end
	end


	def destroy
		entry = HabitEntry.find(params[:id])
    date  = entry.created_at  # caching for JS action
    habit = entry.habit       # caching for JS action
    entry.destroy

    respond_to do |format|
      format.html do
    		redirect_to habit_entries_path
      end
      format.js do
        @day_habit = DayHabit.new(date: date, habit: habit)
        render :update_day_habit_tr, locals: { change: :decrement }
      end
    end
	end


	private

	def filtered_params
		params.require(:habit_entry).permit(:created_at, :date, :id, :habit_id, :time, :user_id)
	end


	def update_date_in_datetime(time)
		fail ArgumentError, "time must be a Time, you pass #{time.inspect} (#{time.class})"
		maybe_date = params.dig(:habit_entry, :date).presence
		return time unless maybe_date
		return time unless /\d{4}-\d{2}-\d{2}/ === maybe_date
		date = Date.parse(maybe_date) rescue nil
		return time unless date
		return time.change(year: date.year, month: date.month, day: date.day)
	end

end
