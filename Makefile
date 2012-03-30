test:
	./node_modules/.bin/mocha --reporter list domain/scout/{{models/*,services}/specs,integration}/*.coffee

.PHONY: test
