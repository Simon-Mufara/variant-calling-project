#!/bin/bash
mkdir -p fastq_trimmed
for fq in raw_data/fastqs/*.fastq; do
  base=$(basename "$fq" .fastq)
  fastp -i "$fq" -o "fastq_trimmed/${base}_trimmed.fastq" --html "fastq_trimmed/${base}_report.html"
done
