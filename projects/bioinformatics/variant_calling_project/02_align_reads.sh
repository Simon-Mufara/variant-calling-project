#!/bin/bash
mkdir -p bam_files
for fq in fastq_trimmed/*_trimmed.fastq; do
  sample=$(basename "$fq" _trimmed.fastq)
  bwa mem bwa_indexed/H37Rv.fasta "$fq" | \
    samtools view -Sb - | \
    samtools sort -o "bam_files/${sample}.sorted.bam"
  samtools index "bam_files/${sample}.sorted.bam"
done
