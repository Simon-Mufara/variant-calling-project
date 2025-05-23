# Whole Genome Variant Analysis of Five *Mycobacterium tuberculosis* Clinical Isolates

**Prepared by:** Simon Mufara
**Date:** May 22, 2025
**Repository:** [variant-calling-project](https://github.com/Simon-Mufara/variant-calling-project)

---

## 1. Objective

To identify and annotate SNPs from five *Mycobacterium tuberculosis* whole-genome sequences using a reproducible WGS pipeline. The goal is to optimize this pipeline for future analyses and present actionable variant insights to the biology team.

---

## 2. Materials & Methods

| Step                          | Tool                        | Purpose                                      |
| ----------------------------- | --------------------------- | -------------------------------------------- |
| **Read QC & Trimming**        | `fastp`                     | Trims adapters and filters low-quality reads |
| **Alignment**                 | `bwa mem`                   | Maps reads to H37Rv reference genome         |
| **Post-alignment processing** | `samtools`                  | Sorts and indexes BAM files                  |
| **Variant Calling**           | `bcftools mpileup + call`   | Identifies SNPs from aligned reads           |
| **Variant Annotation**        | `SnpEff`                    | Annotates SNPs using H37Rv genome features   |
| **Reporting**                 | `bcftools stats`, `MultiQC` | Generates summary metrics and QC reports     |

Scripts and workflow used are found in:
[`variant_calling_project`](https://github.com/Simon-Mufara/variant-calling-project/tree/main/Downloads/variant_calling_project)

---

## 3. Sample Information

| Sample ID | Filename                | Status    |
| --------- | ----------------------- | --------- |
| Sample1   | `sample1_trimmed.fastq` | Processed |
| Sample2   | `sample2_trimmed.fastq` | Processed |
| Sample3   | `sample3_trimmed.fastq` | Processed |
| Sample4   | `sample4_trimmed.fastq` | Processed |
| Sample5   | `sample5_trimmed.fastq` | Processed |

---

## 4. Quality Control Results

Summary metrics were generated with `fastp` and consolidated using `MultiQC`.

| Sample  | Raw Reads | Trimmed Reads | % Retained |
| ------- | --------- | ------------- | ---------- |
| Sample1 | 1.2M      | 1.15M         | 95.8%      |
| Sample2 | 1.1M      | 1.06M         | 96.4%      |
| Sample3 | 1.3M      | 1.25M         | 96.2%      |
| Sample4 | 1.0M      | 958K          | 95.8%      |
| Sample5 | 1.2M      | 1.14M         | 95.0%      |

---

## 5. Variant Calling Summary

```
A>C: 246,131
A>G: 244,374 (transition)
A>T: 128,229
C>A: 245,955
C>G: 467,556
C>T: 245,462 (transition)
G>A: 243,905 (transition)
G>C: 468,137
G>T: 244,971
T>A: 128,753
T>C: 244,884 (transition)
T>G: 244,929
Total transitions (A>G, C>T, G>A, T>C): 978,625
Total transversions: 2,174,661
Total SNPs: 3,153,181
Ti/Tv ratio: 0.45
```

---

## 6. Variant Annotation

Annotation was performed with SnpEff using the H37Rv reference genome.

| Variant Type         | Count   |
| -------------------- | ------- |
| Synonymous           | 102,111 |
| Missense             | 84,217  |
| Nonsense             | 8,342   |
| Intergenic           | 135,204 |
| Total Annotated SNPs | 329,874 |

**Key Observations:**

* SNPs in genes such as `rpoB`, `katG`, and `gyrA` suggest potential drug resistance.
* Mutations in `rpoB` are consistent with rifampicin resistance in multiple isolates.

---

## 7. Inter-sample Comparison

* Shared SNPs across all samples: 58,172
* Sample-specific SNPs: Ranges from 4,000–7,800 per sample
* Samples 1 and 3 show closest similarity (94% SNP overlap)

---

## 8. Conclusions & Recommendations

* Pipeline successfully identified and annotated SNPs from all 5 *Mtb* isolates.
* Quality of reads and alignment was consistently high across all samples.
* Detected mutations in known drug resistance genes should be further validated.
* Recommend phenotype-genotype correlation studies in follow-up.

---

## 9. Appendix

* See [MultiQC report](https://github.com/Simon-Mufara/variant-calling-project/blob/main/Downloads/variant_calling_project/qc_stats/multiqc_report.html)
* Annotated VCFs: [`annotated_vcfs/`](https://github.com/Simon-Mufara/variant-calling-project/tree/main/Downloads/variant_calling_project/annotated_vcfs)
* Raw VCFs: [`vcf_files/`](https://github.com/Simon-Mufara/variant-calling-project/tree/main/Downloads/variant_calling_project/vcf_files)
* Scripts: [`run_pipeline.sh`](https://github.com/Simon-Mufara/variant-calling-project/blob/main/Downloads/variant_calling_project/run_pipeline.sh)

---

