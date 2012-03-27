test:
	./node_modules/.bin/mocha --reporter list domain/scout/{models/*,services}/specs/*.coffee

test-models:
	./node_modules/.bin/mocha --reporter list domain/scout/models/*/specs/*.coffee

test-services:
	./node_modules/.bin/mocha --reporter list domain/scout/services/specs/*.coffee

.PHONY: test
