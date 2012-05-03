test:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/scout/{{models/*,services}/specs,integration}/*.coffee

funky: integration models services

integration:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/scout/integration/*.coffee

services:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/scout/services/specs/*.coffee

models:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/scout/models/specs/*.coffee

.PHONY: test
