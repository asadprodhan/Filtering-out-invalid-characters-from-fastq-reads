# **Filtering out invalid characters from fastq reads** <br />


## **Background**


A fastq read consists of four lines separated by tab. Line 1 is the ID of the read which starts with a “@’ symbol. Line 2 is the read itself i.e. the base sequence. Line 3 is generally just a “+’ sign, that acts as a separator between the base sequence and the quality scores. Finally, Line 4 is a sequence quality scores. These quality scores the ASCII (American Standard Code for Information Interchange) characters, one for each base. However, these four lines together are considered as a complete entry of a sequencing read in fastq format.



Among tens of thousands of sequenceing reads in fastq format, some may have one or more of these four lines missing- partially or entirely! 
When the downstream algarithm such as ‘flye’ genome assembler reads the fastq entries and encounters any incompleteness in the expected four lines, it aborts with an error message ‘invalid characters while reading fastq file’. For example, it may look like as follows:

<br />

![alt text](https://github.com/asadprodhan/Filtering-out-invalid-characters-from-fastq-reads/blob/main/Error_InvalidCharacter.png)
 
<br />

## **How to filter out the incomplete fastq entries that lead to the above error?**
 
 
 
Bioawk is a popular bioinformatics tool. It can read and parse several sequence file formats including fastq. When Bioawk reads a fastq file, it appreas that it only reads the complete entries. Therefore, if we feed a raw fastq file to Bioawk, and then print the reads; we will end having the complete entries only. Any incomplete entries that may lead to the above error are filtered out.
 
 <br />
 
## **The Script**
 
 
 ```
#!/usr/bin/env bash
#textFormating
Red="$(tput setaf 1)"
Green="$(tput setaf 2)"
reset=`tput sgr0` # turns off all atribute
Bold=$(tput bold)

#
baseName=$(basename $1 .fastq)
echo "${Red}${Bold} Processing ${reset}: "${1}""
bioawk -c fastx '{print "@"$name"\n"$seq"\n+\n"$qual}' $1 > ${baseName}_filtered.fastq
echo ""
echo "${Green}${Bold} Processed and saved as${reset} "${baseName}_filtered.fastq""
```

<br /> 
 
## **Usage**
 

```
./fixFastq sampleA.fastq
```
<br />

## **Output**

**The filtered out reads are saved as ‘sampleA_filtered.fastq’**


