test:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/scout/{{models/*,services}/specs,integration}/*.coffee

.PHONY: test
