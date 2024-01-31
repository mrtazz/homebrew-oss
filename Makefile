# some tasks

GITHUB_HEAD_REF ?= main
OS   := $(shell uname -s)
ARCH := $(shell uname -m)
ifeq ($(OS),Darwin)
ifeq ($(ARCH), arm64)
HOMEBREW_LOCATION := /opt/homebrew
else
HOMEBREW_LOCATION := /usr/local
endif
HOMEBREW_TAP_LOCATION := $(HOMEBREW_LOCATION)/Library/Taps
else ifeq ($(OS),Linux)
HOMEBREW_LOCATION := /home/linuxbrew/.linuxbrew
HOMEBREW_TAP_LOCATION := $(HOMEBREW_LOCATION)/Homebrew/Library/Taps
endif

BREW := $(HOMEBREW_LOCATION)/bin/brew

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /tmp/install_homebrew.sh
	/bin/bash < /tmp/install_homebrew.sh

FORMULAE = $(shell ls -1 *.rb | sed 's/\.rb//g')

.PHONY: ci
ci: brew-update brew-tap $(FORMULAE)

.PHONY: brew-update
brew-update: $(BREW)
	$(BREW) update

.PHONY: brew-tap
brew-tap:
	$(BREW) tap mrtazz/oss
	cd $(HOMEBREW_TAP_LOCATION)/mrtazz/homebrew-oss && git checkout $(GITHUB_HEAD_REF)

%:
	$(BREW) install mrtazz/oss/$@

.PHONY: check-updates
check-updates:
	@for p in $(FORMULAE); do ./script/check_for_update.sh $$p ; done
