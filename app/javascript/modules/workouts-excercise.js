$('[data-action="show-excercise-menu"]').click(function() {
  let menu = this.querySelector(".workout-mobile__excercise__menu")
  menu.hidden = !menu.hidden
})
