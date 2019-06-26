"use strict";

import "jquery"

$(document).on("click", '[data-behavior="ajax-btn-1"]', function() {
	// this.disabled  = true // тогда не срабатывает UJS
	this.innerHTML = "🕒" // '<span class="fa fa-refresh fa-spin"></span>'
	this.classList.remove("increment-btn-2--success")
	this.classList.remove("increment-btn-2--danger")
	this.classList.add("increment-btn-2--waiting")
})
