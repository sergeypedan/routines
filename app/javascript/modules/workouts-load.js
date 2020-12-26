"use strict"

import { disable_button, spin_button } from './interface-commons.js'

function container() {
  return document.querySelector('[data-container="workouts"]')
}

function build_url() {
  let current_url = new URL(window.location.href)
  return current_url.origin + current_url.pathname + "?rest=1"
}

function build_request_object() {
  return new Request(build_url(), {
    method: 'GET',
    mode: 'cors',
    headers: new Headers({
      'Content-Type': 'text/plain'
    })
  })
}

$('[data-action="load-more-workouts"]').click(function() {
  disable_button(this)
  spin_button(this)
  fetch(build_request_object())
    .then(res => res.text())
    .then(html => { this.remove(), container().insertAdjacentHTML('beforeend', html) })
    .catch(err => console.error(err))
})
