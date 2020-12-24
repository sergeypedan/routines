function backdrop(div) {
  return div.querySelector('[data-role="backdrop"]')
}

$('[data-action="show-excercise-menu"]').click(function() {
  let menu = this.querySelector('.workout-mobile__excercise__menu')
  backdrop(this).hidden = !menu.hidden
  menu.hidden = !menu.hidden
})
