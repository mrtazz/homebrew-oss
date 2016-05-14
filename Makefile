# some tasks

FORMULAE = $(shell ls -1 *.rb | sed 's/\.rb//g')

.PHONY: ci brew-update brew-tap

ci: brew-update brew-tap $(FORMULAE)

brew-update:
	brew update

brew-tap:
	brew tap mrtazz/oss

%:
	brew install $@
