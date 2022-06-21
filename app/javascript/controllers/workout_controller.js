import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static targets = ["repetitions", "resistance", "weight"]


	increase_repetitions() {
		const input = this.repetitions_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value + step
		if (current_value < min) input.value = min
	}

	decrease_repetitions() {
		const input = this.repetitions_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value - step
		if (current_value < min) input.value = min
	}

	get repetitions_input() {
		return document.querySelector('[name="workout[repetitions_count]"]')
	}


	increase_resistance() {
		const input = this.resistance_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value + step
		if (current_value < min) input.value = min
	}

	decrease_resistance() {
		const input = this.resistance_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value - step
		if (current_value < min) input.value = min
	}

	get resistance_input() {
		return document.querySelector('[name="workout[resistance_duration]"]')
	}


	increase_weight() {
		const input = this.weight_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value + step
		if (current_value < min) input.value = min
	}

	decrease_weight() {
		const input = this.weight_input
		const step  = Number(input.step)
		const min   = Number(input.min)
		const current_value = Number(input.value)
		input.value = current_value - step
		if (current_value < min) input.value = min
	}

	get weight_input() {
		return document.querySelector('[name="workout[weight]"]')
	}

}
