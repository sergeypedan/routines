"use strict"

export function disable_button(button) {
  button.disabled = true
  button.classList.add("disabled")
}

export function spin_button(button) {
  button.querySelector('.fa-refresh').classList.add('fa-spin')
}
