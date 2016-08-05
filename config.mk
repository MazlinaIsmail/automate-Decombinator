# Py scripts for Decombinator analysis pipeline

DEMULTIPLEX_SRC = ./Decombinator/Demultiplexor.py
DEMULTIPLEX_EXE = python $(DEMULTIPLEX_SRC)

DCR_SRC = ./Decombinator/Decombinator.py
DCR_EXE = python $(DCR_SRC)

COLLAPSE_SRC = ./Decombinator/Collapsinator.py
COLLAPSE_EXE = python $(COLLAPSE_SRC)

TRANSLATE_SRC = ./Decombinator/CDR3translator.py
TRANSLATE_EXE = python $(TRANSLATE_SRC)
