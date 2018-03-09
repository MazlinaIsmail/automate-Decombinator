# Last updated: Dec 2017
# MI

##### Background #####
# this is an attempt to automate the Decombinator pipeline
# the pipeline goes something like this:
# 1. combine Illumina demultiplexed files into the three read files (R1, R2, I1)
# 2. demultiplex the data
# 3. run decombinator
# 4. run collapsing script for error correction
# 5. optional : run translating script to get cdr3 sequences

# Added
# -bd param during Collapsing

##### Start #####

# target : dependency1 dependency2 ...
#	action1
#	action2
#	....

# updated Python scripts for M13 oligo
include config.mk

# create empty directories for output
MKDIR_P = mkdir -p
OUT_DIRS = RawData DualIndexDemultiplexed Decombined Collapsed Translated

MV_FILES = mv *.gz 

# file objects
I1_FILES = $(wildcard IlluminaDemultiplexed/*_I1_*)
R1_FILES = $(wildcard IlluminaDemultiplexed/*_R1_*)
R2_FILES = $(wildcard IlluminaDemultiplexed/*_R2_*)

I1 = RawData/I1.fq.gz
R1 = RawData/R1.fq.gz
R2 = RawData/R2.fq.gz

# edit accordingly to match pattern in DualIndexDemultiplexed files
DID_ALPHA = $(filter $(wildcard DualIndexDemultiplexed/*_a*.fq.gz),$(wildcard DualIndexDemultiplexed/*.gz))
DID_BETA = $(filter $(wildcard DualIndexDemultiplexed/*_b*.fq.gz),$(wildcard DualIndexDemultiplexed/*.gz))

DCR_FILES = $(wildcard Decombined/*.gz)

COLL_ALPHA = $(filter $(wildcard *alpha*.gz),$(wildcard *.gz))
COLL_BETA = $(filter $(wildcard *beta*.gz),$(wildcard *.gz))

#
# main
#

all : dirs I1.fq.gz R1.fq.gz R2.fq.gz Demultiplex moveDemultiplex DcrA DcrB moveDcr Collapse

dirs :
	$(MKDIR_P) $(OUT_DIRS)


I1.fq.gz : $(I1_FILES)
	gunzip -c $^ | gzip >RawData/$@

R1.fq.gz : $(R1_FILES)
	gunzip -c $^ | gzip >RawData/$@

R2.fq.gz : $(R2_FILES)
	gunzip -c $^ | gzip >RawData/$@

Demultiplex : $(I1) $(R1) $(R2) $(DEMULTIPLEX_SRC) index_file.csv
	$(DEMULTIPLEX_EXE) -r1 $(R1) -r2 $(R2) -i1 $(I1) -ix index_file.csv

moveDemultiplex :
	$(MV_FILES) DualIndexDemultiplexed/

DcrA : $(DCR_SRC)
	for file in $(DID_ALPHA); do echo $$file; $(DCR_EXE) -fq $$file -c a; done

DcrB : $(DCR_SRC)
	for file in $(DID_BETA); do echo $$file; $(DCR_EXE) -fq $$file -c b; done

moveDcr :
	$(MV_FILES) Decombined/

Collapse : $(COLLAPSE_SRC)
	for file in $(DCR_FILES); do echo $$file; $(COLLAPSE_EXE) -in $$file -bd; done

TrA : $(TRANSLATE_SRC)
	for file in $(COLL_ALPHA); do echo $$file; $(TRANSLATE_EXE) -in $$file -c a -np; done

TrB : $(TRANSLATE_SRC)
	for file in $(COLL_BETA); do echo $$file; $(TRANSLATE_EXE) -in $$file -c b -np; done

move :
	mv *.freq.gz Collapsed/ && mv *.gz Translated/

.PHONY : clean
clean :
	rm -rf *.fq *.gz  *.n12 Collapsed Decombined DualIndexDemultiplexed Logs RawData Translated
