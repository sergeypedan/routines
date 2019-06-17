"use strict";

(function() {

	// State

	const form_values   = { saved: { reps: -1, time: -1 }, off: { reps: 1, time: 0 } }


	// Finders

	const checkbox      = () => document.querySelector('[name="excercise[repetition_based]"][type="checkbox"]')
	const reps_controls = () => document.getElementById("reps-controls")
	const time_controls = () => document.getElementById("time-controls")
	const reps_input    = () => document.querySelector('[name="excercise[default_repetitions_count]"]')
	const time_input    = () => document.querySelector('[name="excercise[default_time]"]')


	// Modifiers

	const toggle_reps_based_controls = () => state_is_reps_based() ? switch_to_reps_based() : switch_to_time_based()


	// Checks

	function state_is_reps_based() {
		return checkbox().checked
	}


	function has_reps_controls() {
	  if (!checkbox()) return false
	  if (!reps_controls()) return false
	  if (!time_controls()) return false
	  return true
	}


	// Manipulators

	function switch_to_reps_based() {
		form_values.saved.time = time_input().value
		time_input().setAttribute("value", form_values.off.time)
		time_controls().hidden = true

		if (form_values.saved.reps !== -1) reps_input().setAttribute("value", form_values.saved.reps)
		reps_controls().hidden = false
	}


	function switch_to_time_based() {
		form_values.saved.reps = reps_input().value
		reps_input().setAttribute("value", form_values.off.reps)
		reps_controls().hidden = true

		if (form_values.saved.time !== -1) time_input().setAttribute("value", form_values.saved.time)
		time_controls().hidden = false
	}


	// Events

	if (has_reps_controls()) {
		checkbox().addEventListener("change", () => { toggle_reps_based_controls() } )
		document.addEventListener("DOMContentLoaded", () => toggle_reps_based_controls() )
	}

})()
