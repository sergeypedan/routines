import { Controller } from "stimulus"

export default class extends Controller {

	static targets = ["repetitions", "resistance", "weight"]


	increase_repetitions() {
		const input = this.repetitions_input
		const step = 1
		input.value = Number(input.value) + step
	}

	decrease_repetitions() {
		const input = this.repetitions_input
		const step = 1
		input.value = Number(input.value) - step
	}

	get repetitions_input() {
		return document.querySelector('[name="workout[repetitions_count]"]')
	}


	increase_resistance() {
		const input = this.resistance_input
		const step = 1
		input.value = Number(input.value) + step
	}

	decrease_resistance() {
		const input = this.resistance_input
		const step = 1
		input.value = Number(input.value) - step
	}

	get resistance_input() {
		return document.querySelector('[name="workout[resistance_duration]"]')
	}


	increase_weight() {
		const input = this.weight_input
		const step = 0.5
		input.value = Number(input.value) + step
	}

	decrease_weight() {
		const input = this.weight_input
		const step = 0.5
		input.value = Number(input.value) - step
	}

	get weight_input() {
		return document.querySelector('[name="workout[weight]"]')
	}

}
