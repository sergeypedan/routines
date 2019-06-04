# frozen_string_literal: true

class DayHabit

  attr_reader :date
  attr_reader :habit

  def initialize(date:, habit:)
    @date  = date.to_date
    @habit = habit
    @specific_habit = time_based? ? Habit::TimeBased.new(@habit) : Habit::RoundsBased.new(@habit)
  end

  def applicable?
    @habit.created_at < @date
  end

  def completed?
    return done_rounds >= @specific_habit.target_rounds unless time_based?
    done_time.in(:seconds) >= @specific_habit.target_time.in(:seconds)
  end

  # Delegate me
  def time_based?
    @habit.time_based?
  end

  def entries
    @entries ||= HabitEntry.where("DATE(created_at) = ?", @date)
  end

  def done_rounds
    @done_rounds ||= entries.size
  end

  def done_time
    @done_time ||= if time_based?
                      amount = (entries.map(&:duration).map(&:seconds).reduce(&:+)) || 0
                      Duration.new amount, :seconds
                    else
                      0
                    end
  end

  def target_str
    @specific_habit.target_str
  end

  def progress_str
    if time_based?
      "#{done_time} min in #{done_rounds} round#{"s" if done_rounds > 1}"
    else
      "#{done_rounds} rounds"
    end
  end

end
