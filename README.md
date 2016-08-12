# automate-decombinator
developed and tested on Unix system

Automating processing of TCR sequencing data based on the Decombinator pipeline. The pipeline basically goes something like this

1. combine Illumina demultiplexed files into three raw data files; R1, R2 and I1 (de-demultiplex?)
2. demultiplex the data
3. run Decombinator
4. run collapsing script for barcode collapsing and error correction
5. optional : run translating script to get CDR3 sequences

The automating process combines all the steps above into one workflow using a makefile. The GNU Make website provides a nice, basic overview of what make and makefiles are [1].

Some of the prerequisites will need to be downloaded from github. On the github page, click on the 'Clone or Download' button, and choose 'Download ZIP'

1. the make program

   Unix/Linux systems usually have make installed by default
   
1. automate-decombinator

   https://github.com/innate2adaptive/automate-decombinator
   
2. Decombinator

   https://github.com/innate2adaptive/Decombinator
   
4. index file

   call it index_file.csv
   
5. a folder containing the Illumina demultiplexed files

   call the folder IlluminaDemultiplexed

Once it's all set up, fire up the Terminal

1. change directory to the automate-Decombinator directory - list files to make sure all the items above are there
2. in the shell, type

      make
      
   and [enter]

The make program will look for a file called Makefile and execute the targets. By running make, the processing pipeline will go from

combine files into R1, R2 and I1 files -> demultiplex -> decombinate -> collapsing

To continue with translating to protein sequence (recommended), type

   make TrA TrB move

References:

[1] https://www.gnu.org/software/make/manual/make.html
