// import "jquery"
//
// document.addEventListener "DOMContentLoaded", () ->
//
// 	random_record_uid = () ->
// 		new Date().getTime()
//
//
// 	new_field_html = (link) ->
// 		regexp      = new RegExp(link.dataset.objectId, 'g')
// 		fields_html = link.dataset.fields
// 		fields_html.replace(regexp, random_record_uid())
//
//
// 	remove_field_checkbox = (link) ->
// 		$(link).prev('input[type="hidden"]')[0]
//
//
// 	$('form').on 'click', '[data-action="remove-field"]', (event) ->
// 		event.preventDefault()
// 		remove_field_checkbox().value = 1
// 		$(this).closest('fieldset').hide()
//
//
// 	$('form').on 'click', '[data-action="insert-new-field"]', (event) ->
// 		event.preventDefault()
// 		$(this).before( new_field_html(this) )
