SHELL = /bin/bash

.PHONY: all html pdfs

all: html pdfs

html: index.html en.html nl.html

pdfs: cryptoparty-privacycafe-menu-combined-en.pdf \
      cryptoparty-privacycafe-menu-combined-nl.pdf

%.html: %.md
	{ echo '<!DOCTYPE html><html><head>'; \
	  echo '<meta http-equiv="content-type"'; \
	  echo ' content="text/html; charset=utf-8" />'; \
	  echo '<title>Privacy Café / CryptoParty</title>'; \
	  echo '</head><body>'; \
	  redcarpet --parse-no-extra-emphasis --parse-fenced-code-blocks \
	    --parse-autolink --parse-lax-spacing < $<; \
	  echo '</body></html>'; \
	} > $@

cryptoparty-privacycafe-menu-combined-%.pdf: \
  cryptoparty-privacycafe-menu-cover-%.pdf \
  cryptoparty-privacycafe-menu-inside-%.pdf
	pdftk $^ cat output $@
