# Py scripts for Decombinator analysis pipeline

DEMULTIPLEX_SRC = ./Decombinator-master/Demultiplexor.py
DEMULTIPLEX_EXE = python $(DEMULTIPLEX_SRC)

DCR_SRC = ./Decombinator-master/Decombinator.py
DCR_EXE = python $(DCR_SRC)

COLLAPSE_SRC = ./Decombinator-master/Collapsinator.py
COLLAPSE_EXE = python $(COLLAPSE_SRC)

TRANSLATE_SRC = ./Decombinator-master/CDR3translator.py
TRANSLATE_EXE = python $(TRANSLATE_SRC)
