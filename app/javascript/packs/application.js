"use strict"


import "jquery"


// Rails UJS
import Rails from 'rails-ujs'
Rails.start()


// Bootstrap

// import "bootstrap/dist/js/bootstrap.js"
// import "bootstrap/js/dist/util.js"
import "bootstrap/js/dist/alert.js"
// import "bootstrap/js/dist/button.js"
import "bootstrap/js/dist/collapse.js"


// CSS

import "stylesheets/site-bootstrap.sass"
import "stylesheets/site-style.sass"
// import "stylesheets/site-vendor.sass"


// import { stub_datetime_inputs } from "../modules/modernizer-datetime.js"
import 'nodep-date-input-polyfill'
import { register_toggle_reps_based_controls } from "../modules/reps-based-toggle"

// document.addEventListener("DOMContentLoaded", function() {
// 	stub_datetime_inputs()
// })

import "../modules/ajax-buttons-1"
import "../modules/ajax-form-helper"
import "../modules/sortable-init"


// stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


// import * as d3 from "d3"


// SmoothScroll
// import SmoothScroll from 'smooth-scroll'

// options: https://github.com/cferdinandi/smooth-scroll#global-settings
// var scroll = new SmoothScroll('[data-scroll]', { speed: 500, easing: 'easeOutQuint', updateURL: false })
// window.SmoothScroll = SmoothScroll


// import "vendor/modernizr-3.7.1"


import "jquery-ui/ui/core"
import "jquery-ui/ui/widgets/sortable"
