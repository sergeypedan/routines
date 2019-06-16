json.array!(habits_stats) do |habit_days|

	habit_days.each do |day_habit|

		json.date                 day_habit.date
		json.habit_name           day_habit.habit.name
		json.applicable           day_habit.applicable?
		json.completed            day_habit.completed?
		json.completed_fraction   day_habit.completed_fraction
		json.completed_percent    day_habit.completed_percent
		json.exceeded             day_habit.exceeded?

		# json.habit do
		# 	habit.name            data.ar_habit.name
		# end

	end

end
