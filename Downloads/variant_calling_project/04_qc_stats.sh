#!/bin/bash
mkdir -p qc_stats
for vcf in vcf_files/bcftools/*.vcf.gz; do
  sample=$(basename "$vcf" .vcf.gz)
  bcftools stats "$vcf" > "qc_stats/${sample}.stats"
done
plot-vcfstats -p qc_stats/plots qc_stats/*.stats
