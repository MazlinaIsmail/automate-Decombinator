# Py scripts for Decombinator analysis pipeline

DEMULTIPLEX_SRC = ./ligTCRseq/ligTCRdemultiplex.py
DEMULTIPLEX_EXE = python $(DEMULTIPLEX_SRC)

DCR_SRC = ./ligTCRseq/ligTCRDCR.py
DCR_EXE = python $(DCR_SRC)

COLLAPSE_SRC = ./ligTCRseq/ligTCRcollapse.py
COLLAPSE_EXE = python $(COLLAPSE_SRC)

TRANSLATE_SRC = ./ligTCRseq/ligTCRtranslateCDR3.py
TRANSLATE_EXE = python $(TRANSLATE_SRC)
