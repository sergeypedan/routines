function backdrop(div) {
  return div.querySelector('[data-role="backdrop"]')
}

function close_all_backdrops() {
  $('[data-role="backdrop"]').attr('hidden', '')
}

function hide_all_menus() {
  $('.workout-mobile__excercise__menu').attr('hidden', '')
}

$('[data-action="show-excercise-menu"]').click(function() {
  let menu = this.querySelector('.workout-mobile__excercise__menu')
  let should_open = !!menu.hidden
  if (should_open) { close_all_backdrops(), hide_all_menus() }
  backdrop(this).hidden = !should_open
  menu.hidden = !should_open
})
