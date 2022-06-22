'use strict';

import 'jquery'

$(document).on('keydown', '[inputmode="decimal"]', function(event) {
	if (event.originalEvent.key === ',') {
		event.preventDefault()
		this.value = this.value + '.'
	}
})
