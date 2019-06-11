"use strict"


import "jquery"


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


// stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


// import * as d3 from "d3"
