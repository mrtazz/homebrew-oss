# some tasks

FORMULAE = $(shell ls -1 *.rb | sed 's/\.rb//g')

ci: $(FORMULAE)

%:
	brew install $@
