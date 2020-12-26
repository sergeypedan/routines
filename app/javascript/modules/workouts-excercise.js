let menu_selector = '[role="menu"]'
let backdrop_selector = '[data-role="backdrop"]'

function backdrop(div) {
  return div.querySelector(backdrop_selector)
}

function close_all_backdrops() {
  $(backdrop_selector).attr('hidden', '')
}

function hide_all_menus() {
  $(menu_selector).attr('hidden', '')
}

$('[data-action="show-cell-menu"]').click(function() {
  let menu = this.querySelector(menu_selector)
  let should_open = !!menu.hidden
  if (should_open) { close_all_backdrops(), hide_all_menus() }
  backdrop(this).hidden = !should_open
  menu.hidden = !should_open
})
