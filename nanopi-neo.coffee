
deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'nanopi-neo'
	name: 'Nanopi Neo'
	arch: 'armv7hf'
	state: 'experimental'
	community: true
	private: true

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/nanopi-neo/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/nanopi-neo/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/nanopi-neo/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'nanopi-neo'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-nanopi-neo.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
