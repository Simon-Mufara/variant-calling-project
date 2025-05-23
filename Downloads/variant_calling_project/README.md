# MTB Variant Calling Pipeline 🧬

A reproducible and modular pipeline for variant calling in *Mycobacterium tuberculosis* (H37Rv), using short-read data and `bcftools`. Built with bash scripts and structured for scalability.

--

## 📁 Project Structure

variant_calling_project/
├── raw_data/ # Contains raw FASTQ files
├── fastq_trimmed/ # Output from fastp
├── bwa_indexed/ # BWA indexed H37Rv reference
├── bam_files/ # Sorted and indexed BAM files
├── vcf_files/ # Variant calls from bcftools
│ └── bcftools/
├── annotated_vcfs/ # (Optional) Annotated variants
├── qc_stats/ # QC metrics + plots
├── scripts/ # Modular scripts for each step
│ ├── trim_reads.sh
│ ├── align_reads.sh
│ ├── variant_calling.sh
│ ├── qc_stats.sh
│ └── run_pipeline.sh
├── run_pipeline.sh # Master runner script
├── .gitattributes # Git LFS tracked files
├── .gitignore
└── README.md # You're here!


---

## 🔧 Tools Used

- [`fastp`](https://github.com/OpenGene/fastp) — read trimming and quality control
- [`BWA`](http://bio-bwa.sourceforge.net/) — alignment to H37Rv reference
- [`Samtools`](http://www.htslib.org/) — BAM processing
- [`Bcftools`](http://samtools.github.io/bcftools/) — variant calling and stats
- [`plot-vcfstats`](http://samtools.github.io/bcftools/howtos/plot-vcfstats.html) — VCF QC plots
- [`Git LFS`](https://git-lfs.github.com/) — large file tracking for `.bam` and `.vcf.gz`

---

## 🚀 Running the Pipeline

Ensure conda environment or tools are in `$PATH`. Then run:

```bash
bash run_pipeline.sh

This will:

Trim reads (fastp)

Align to H37Rv (bwa mem)

Sort and index BAMs (samtools)

Call variants (bcftools mpileup + call)

Merge VCFs and generate stats and plots

📊 Outputs
Trimmed reads: fastq_trimmed/

Sorted BAMs: bam_files/

Raw VCFs: vcf_files/bcftools/

Merged VCF: vcf_files/bcftools/merged.vcf.gz

Variant stats & plots: qc_stats/ + qc_stats/plots/

Example plot: Ti/Tv ratio, SNP counts, indel stats, per-sample call rate.

🧠 Interpretation
Use the .stats files to compare quality metrics across samples.

Merge VCF is ready for annotation with tools like SnpEff or VEP.

Explore variants per gene, resistance loci, or population structure.

⚖️ License
This project is licensed under the MIT License.
# -variant-calling-project
