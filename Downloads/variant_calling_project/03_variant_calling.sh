#!/bin/bash
mkdir -p vcf_files/bcftools
for bam in bam_files/*.sorted.bam; do
  sample=$(basename "$bam" .sorted.bam)
  bcftools mpileup -f bwa_indexed/H37Rv.fasta "$bam" | \
    bcftools call -mv -Oz -o "vcf_files/bcftools/${sample}.vcf.gz"
  bcftools index "vcf_files/bcftools/${sample}.vcf.gz"
done

bcftools merge vcf_files/bcftools/*.vcf.gz -Oz -o vcf_files/bcftools/merged.vcf.gz
bcftools index vcf_files/bcftools/merged.vcf.gz
