TITLE=WHITEPAPER_TITLE

LATEX=xelatex
LATEX_OPTIONS=-halt-on-error

RST2LATEX=rst2latex.py
STYLESHEET=whitepaper
RST2LATEX_OPTIONS=--stylesheet=$(STYLESHEET) --literal-block-env=idlcode --smart-quotes="yes"


.PHONY: clean

$(TITLE).pdf: $(TITLE).tex
	$(LATEX) $(LATEX_OPTIONS) $(TITLE).tex
	$(LATEX) $(LATEX_OPTIONS) $(TITLE).tex
	$(LATEX) $(LATEX_OPTIONS) $(TITLE).tex

$(TITLE).tex: $(TITLE).rst
	$(RST2LATEX) $(RST2LATEX_OPTIONS) $(TITLE).rst $(TITLE).tex

clean: 
	rm -f $(TITLE).{tex,out,log,aux}
	rm -f $(TITLE).pdf
