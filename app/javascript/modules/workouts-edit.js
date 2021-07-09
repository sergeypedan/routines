function get_selected_option(select) {
	return Array.from(select.querySelectorAll('option')).find(option => option.selected)
}

function switch_visibility_to_rep_based() {
	Array.from(document.querySelectorAll('[data="about-duration"]'   )).forEach(el => el.hidden = true)
	Array.from(document.querySelectorAll('[data="about-repetitions"]')).forEach(el => el.hidden = false)
}

function switch_visibility_to_time_based() {
	Array.from(document.querySelectorAll('[data="about-duration"]'   )).forEach(el => el.hidden = false)
	Array.from(document.querySelectorAll('[data="about-repetitions"]')).forEach(el => el.hidden = true)
}

function fill_rep_based_inputs(excercise) {
	document.querySelector('[name="workout[repetitions_count]"]'  ).value = excercise.default_repetitions_count
	document.querySelector('[name="workout[resistance_duration]"]').value = 0
	document.querySelector('[name="workout[weight]"]'             ).value = excercise.default_weight
}

function fill_time_based_inputs(excercise) {
	document.querySelector('[name="workout[repetitions_count]"]'  ).value = 1
	document.querySelector('[name="workout[resistance_duration]"]').value = (excercise.default_time ? (excercise.default_time / 60) : 0)
	document.querySelector('[name="workout[weight]"]'             ).value = 0
}

function update_fields(data, select, should_prefill) {
	let excercise_id = Number(get_selected_option(select).value)
	let excercise = data.find(obj => obj['id'] === excercise_id)
	if (!excercise) return
	excercise['repetition_based?'] ? switch_visibility_to_rep_based() : switch_visibility_to_time_based()
	if (!should_prefill) return
	excercise['repetition_based?'] ? fill_rep_based_inputs(excercise) : fill_time_based_inputs(excercise)
}

function form_is_for_new_record() {
	return (location.pathname.includes('/new') && !location.pathname.includes('/edit'))
}

window.addEventListener('load', function() {
	let select   = document.querySelector('[name="workout[excercise_id]"]')
	let meta_tag = document.querySelector('meta[name="excercises"]')
	if (!meta_tag || !select) return
	let data     = JSON.parse(meta_tag.content)
	select.addEventListener('change', function() { update_fields(data, this, true) })
	update_fields(data, select, false)
})
