TEXFLAGS = -bibtex -pdf -interaction=nonstopmode -use-make
BUILD_DIR = build

.PHONY: all clean $(BUILD_DIR)/thesis.pdf

all: $(BUILD_DIR)/thesis.pdf

$(BUILD_DIR)/thesis.pdf: thesis.tex $(BUILD_DIR)
	latexmk  $(TEXFLAGS) -jobname=$(@:.pdf=) -f $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	cd build && rm  *.nlo *.lot *.bcf *.acn *.glsdefs *.aux *.log *.toc *.bak *.sav *.ist *.nls  *.nlo *.xml *.xdy *.lof 	
#latexmk $(TEXFLAGS) 
-jobname=$(BUILD_DIR)/ -C thesis.tex
