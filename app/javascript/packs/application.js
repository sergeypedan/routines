// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import { stub_datetime_inputs } from "../modules/modernizer-datetime.js"
import 'nodep-date-input-polyfill'
import { register_toggle_reps_based_controls } from "../modules/reps-based-toggle"

// document.addEventListener("DOMContentLoaded", function() {
// 	stub_datetime_inputs()
// })

register_toggle_reps_based_controls()
