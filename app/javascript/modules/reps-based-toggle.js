// Finders

const checkbox      = () => document.querySelector('[name="excercise[repetition_based]"][type="checkbox"]')
const reps_controls = () => document.getElementById("reps-controls")
const time_controls = () => document.getElementById("time-controls")


// Checks

function state_is_reps_based() {
	const input = checkbox()
	if (!input) return true
	return input.checked
}


function has_reps_controls() {
  if (!checkbox()) return false
  if (!reps_controls()) return false
  if (!time_controls()) return false
  return true
}


// Manipulators

function switch_to_reps_based() {
	reps_controls().hidden = false
	time_controls().hidden = true
}

function switch_to_time_based() {
	reps_controls().hidden = true
	time_controls().hidden = false
}

const toggle_reps_based_controls = () => state_is_reps_based() ? switch_to_reps_based() : switch_to_time_based()

function register_toggle_reps_based_controls() {
  if (!has_reps_controls()) return
	document.addEventListener("DOMContentLoaded", () => toggle_reps_based_controls() )
	checkbox().addEventListener("change", () => toggle_reps_based_controls() )
}

register_toggle_reps_based_controls()
