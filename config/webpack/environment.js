const { environment } = require('@rails/webpacker')
const coffee = require('./loaders/coffee')
const webpack = require('webpack')

environment.loaders.prepend('coffee', coffee)

environment.plugins.append(
	'Provide',
	new webpack.ProvidePlugin({
		$:               'jquery',
		jQuery:          'jquery',
		'window.jQuery': 'jquery',
		Popper:         ['popper.js', 'default']
	})
)

module.exports = environment
