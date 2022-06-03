# includeme.el --- Automatic C/C++ '#include' and 'using' in Emacs
# Copyright (c) 2013 Justine Tunney

REFDATE ?= 20190607
LINK ?= http://upload.cppreference.com/mwiki/images/8/80/cppreference-doc-$(REFDATE).tar.xz

README.md: make-readme-markdown.el includeme.el
	emacs --script $< <includeme.el >$@ 2>/dev/null
make-readme-markdown.el:
	wget -q -O $@ https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el
.INTERMEDIATE: make-readme-markdown.el

index:
	python3 generate.py cppreference-doc-$(REFDATE)

fetch:
	wget $(LINK)
	tar -xf cppreference-doc-$(REFDATE).tar.xz

dev: index README.md
