let menu_selector = '[role="menu"]'
let backdrop_selector = '[data-role="backdrop"]'
let cell_menu_btn_selector = '[data-action="show-cell-menu"]'

function backdrop(div) {
	return div.querySelector(backdrop_selector)
}

function close_all_backdrops() {
	$(backdrop_selector).attr('hidden', '')
}

function hide_all_menus() {
	$(menu_selector).attr('hidden', '')
}

$(document).on("click", cell_menu_btn_selector, function() {
	let menu = this.querySelector(menu_selector)
	let should_open = !!menu.hidden
	if (should_open) { close_all_backdrops(), hide_all_menus() }
	backdrop(this).hidden = !should_open
	menu.hidden = !should_open
})
