REPORTER = spec
MOCHA = node_modules/.bin/mocha

test:
	@NODE_ENV=test $(MOCHA) --require should --reporter $(REPORTER) --timeout 30000
	
test-colors:
	@NODE_ENV=test $(MOCHA) --require should --reporter $(REPORTER) --colors --timeout 30000

test-cov: lib-cov
	@FLUENTFFMPEG_COV=1 $(MAKE) test REPORTER=html-cov > test/coverage.html

lib-cov:
	@rm -fr ./$@
	@jscoverage lib $@

publish: 
	@npm version patch -m "version bump"
	@npm publish

.PHONY: test test-cov lib-cov test-colors publish