# automate-decombinator
# developed and tested on Unix system

Automating processing of TCR sequencing data based on the Decombinator pipeline. The pipeline basically goes something like this

1. combine Illumina demultiplexed files into three raw data files; R1, R2 and I1 (de-demultiplex?)
2. demultiplex the data
3. run Decombinator
4. run collapsing script for barcode collapsing and error correction
5. optional : run translating script to get CDR3 sequences

The automating process combines all the steps above into one workflow using a makefile. The GNU Make website provides a nice, basic overview of what make and makefiles are (ref). 

Here are the things you'll need to run the automating script:

1. the Make program
2. the automate-decombinator folder - contains this README file, Makefile and config.mk 
3. the Decombinator folder

** To be continued **

References:
