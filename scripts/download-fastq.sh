#!/bin/bash

# Set some useful settings to handle errors
set -euo pipefail

# Define URLs and file paths
FASTQ_R1="SRR11518889_1.fastq.gz"
FASTQ_R2="SRR11518889_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

DATA_DIR="../data/raw/SRP255885"
mkdir -p ${DATA_DIR}

###### Process the R1 file ######

# Download the file
echo "Downloading the R1 file"
curl -OsS ${FASTQ_URL}/${FASTQ_R1}
    # curl notes
        # -O: keep same file name as on internet
        # -s: don't print status bar or errors
        # -S: but actually I do want to print errors

# Move the file
mv ${FASTQ_R1} ${DATA_DIR}/

#Print the number of lines in the file
echo "The R1 file has this many lines"
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l


###### Process the R2 file ######

# Download the file
echo "Downloading the R1 file"
curl -OsS ${FASTQ_URL}/${FASTQ_R2}

# Move the file
mv ${FASTQ_R2} ${DATA_DIR}/

#Print the number of lines in the file
echo "The R1 file has this many lines"
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l