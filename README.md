# automate-decombinator

Automating processing of TCR sequencing data based on the Decombinator pipeline. The pipeline basically goes something like this

1. combine Illumina demultiplexed files into three raw data files; R1, R2 and I1 (de-demultiplex?)
2. demultiplex the data
3. run Decombinator
4. run collapsing script for barcode collapsing and error correction
5. optional : run translating script to get CDR3 sequences

The automating process combines all the steps above into one workflow using a makefile. The GNU Make website provides a nice, basic overview of what make and makefiles are (ref). 

In order to run the makefile, you will need to install make.

** To be continued **

References:
