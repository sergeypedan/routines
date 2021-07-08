function get_selected_option(select) {
	return Array.from(select.querySelectorAll('option')).find(option => option.selected)
}

function switch_to_rep_based(excercise) {
	Array.from(document.querySelectorAll('[data="about-duration"]'   )).forEach(el => el.hidden = true)
	Array.from(document.querySelectorAll('[data="about-repetitions"]')).forEach(el => el.hidden = false)
	document.querySelector('[name="workout[repetitions_count]"]').value = excercise.default_repetitions_count
	document.querySelector('[name="workout[weight]"]').value = excercise.default_weight
}

function switch_to_time_based(excercise) {
	Array.from(document.querySelectorAll('[data="about-duration"]'   )).forEach(el => el.hidden = false)
	Array.from(document.querySelectorAll('[data="about-repetitions"]')).forEach(el => el.hidden = true)
	document.querySelector('[name="workout[resistance_duration]"]').value = (excercise.default_time / 60)
}

function switch_fields(data, select) {
	var excercise_id = Number(get_selected_option(select).value)
	var excercise = data.find(obj => obj['id'] === excercise_id)
	console.log('excercise', excercise)
	excercise['repetition_based?'] ? switch_to_rep_based(excercise) : switch_to_time_based(excercise)
}

window.addEventListener('load', function() {
	var select = document.querySelector('[name="workout[excercise_id]"]')
	var data   = JSON.parse(document.querySelector('meta[name="excercises"]').content)
	if (!data || !select) return
	switch_fields(data, select)
	select.addEventListener('change', function() { switch_fields(data, this) })
})
