INSTALL=ln -s
RM=rm -f

SRCFILES=$(shell ls -d [a-z]*)
DOTFILES=$(addprefix $(HOME)/., gitignore_global $(SRCFILES))

usage:
	@echo Usage:
	@echo '	make install	Link dotfiles to home directory.'
	@echo '	make uninstall	Delete dotfiles from home directory.'

install: $(DOTFILES)

uninstall:
	$(RM) $(DOTFILES)

$(HOME)/.gitignore_global: .gitignore
	$(INSTALL) $(PWD)/$< $@

$(HOME)/.%: %
	$(INSTALL) $(PWD)/$< $@
