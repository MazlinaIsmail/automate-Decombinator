# May 2016
# MI

##### Background #####
# this is an attempt to automate the Decombinator pipeline
# the pipeline goes something like this:
# 1. combine Illumina demultiplexed files into the three read files (R1, R2, I1)
# 2. demultiplex the data
# 3. run decombinator
# 4. run collapsing script for error correction
# 5. optional : run translating script to get cdr3 sequences

# let's see if a Makefile can do all this!

##### Start #####

# target : dependency1 dependency2 ...
#	action1
#	action2
#	....

# path to Illumina demultiplexed files
I1_FILES = $(wildcard IlluminaDemultiplexed/*_I1_*)
R1_FILES = $(wildcard IlluminaDemultiplexed/*_R1_*)
R2_FILES = $(wildcard IlluminaDemultiplexed/*_R2_*)

# outputs files will be created wherever the Makefile is
all : I1.fastq.gz R1.fastq.gz R2.fastq.gz

I1.fastq.gz : $(I1_FILES)
	gunzip -c $^ | gzip >$@

R1.fastq.gz : $(R1_FILES)
	gunzip -c $^ | gzip >$@

R2.fastq.gz : $(R2_FILES)
	gunzip -c $^ | gzip >$@
