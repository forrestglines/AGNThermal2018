NAME=AGNThermal2018

LATEX=pdflatex 

all:  $(NAME).pdf

dvi: $(NAME).tex
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME)

$(NAME).pdf: $(NAME).tex $(NAME).bib figures/*.pdf figures/*.eps figures/*.png
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME) || true 
#	dvipdf $(NAME).dvi $(NAME).pdf
	rm -f $(NAME).blg $(NAME).log $(NAME).aux

clean:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *log *-temp.* *.blg *~ $(NAME).ps $(NAME).bbl $(NAME).pdf msNotes.bib


