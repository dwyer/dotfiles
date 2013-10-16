SRCFILES=$(shell ls -d [a-z]*)
DOTFILES=$(addprefix $(HOME)/., $(SRCFILES))

usage:
	@echo Usage:
	@echo '	make install	Link dotfiles to home directory.'
	@echo '	make uninstall	Delete dotfiles from home directory.'

install: $(DOTFILES)

uninstall:
	rm -fr $(DOTFILES)

$(HOME)/.%: %
	ln -s $(PWD)/$< $@
