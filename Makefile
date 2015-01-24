SHELL = /bin/bash

.PHONY: all html pdfs

all: html pdfs

html: index.html en.html nl.html

pdfs: cryptoparty-privacycafe-menu-combined-en.pdf \
      cryptoparty-privacycafe-menu-combined-nl.pdf

%.html: %.md
	redcarpet --parse-no-extra-emphasis --parse-fenced-code-blocks \
	  --parse-autolink --parse-lax-spacing < $< > $@

cryptoparty-privacycafe-menu-combined-en.pdf:
	pdftk cryptoparty-privacycafe-menu-{cover,inside}-en.pdf \
	  cat output $@

cryptoparty-privacycafe-menu-combined-nl.pdf:
	pdftk cryptoparty-privacycafe-menu-{cover,inside}-nl.pdf \
	  cat output $@
