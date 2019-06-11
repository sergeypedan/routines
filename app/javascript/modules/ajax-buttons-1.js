"use strict";


function ajax_button(element) {
  if(element.dataset.behavior === "ajax-btn-1") return element
  if(element.parentElement.dataset.behavior === "ajax-btn-1") return element.parentElement
  return null
}

// document.addEventListener("click", function(event) {
//   const button = ajax_button(event.target)
//   if (!button) return
//   button.innerHTML = '<span class="fa fa-refresh fa-spin"></span>'
// }, false)
