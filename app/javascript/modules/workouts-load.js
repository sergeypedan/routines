let btn_selector = '[data-action="load-more-workouts"]'

function remove_btn() {
  document.querySelector(btn_selector).remove()
}

function spin_button() {
  document.querySelector(btn_selector).querySelector('.fa').classList.add('fa-spin')
}

function container() {
  return document.querySelector('[data-container="workouts"]')
}

function insert_response_into_page(response) {
  container().insertAdjacentHTML('beforeend', response)
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

$(btn_selector).click(function() {
  spin_button()
  fetch(build_request_object())
    .then(res => res.text())
    .then(html => { remove_btn(), insert_response_into_page(html) })
    .catch(err => console.error(err))
})
