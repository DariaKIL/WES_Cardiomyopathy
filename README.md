# Pipeline for variant calling by HaplotypeCaller (GATK)

## Description
Laboratory of Molecular Biology and Genetics of Federal Almazov Medical Research Center regularly performs exom sequencing in patients. As a rule, prior to whole exom sequencing (WES), the analysis of the hereditary nature of the disease is carried out and these patients are sequenced on small panels with targeted enrichment of the genes described in the literature and known as causal in different type of cardiomyopathy. If the small panel does not produce results, then WES can be conduct and the analysis of rare variants using frequency databases allows identifying pathogenic variants in ~ 70% of such patients.

## Goals and objectives
Our goal was to detect previously unknown variants of SNP and indels in patients with different types of idiopathic cardiomyopathies.

* Write Pipeline for Variant Calling and Variant Filtration
* Analyze data with HaplotypeCaller
* Annotate with Annovar, SnpEff.
* All stages are included in the Snakemake pipeline, presented in this repository.

## Material
10 different WES samples  from patients with idiopathic cases of caridiomyopathy

## Methods
```
bcftools - sudo apt install bcftools
GATK-4.1.2.0 - https://software.broadinstitute.org/gatk/download/
annovar - http://download.openbioinformatics.org/annovar_download_form.php
SNPEff - snpeff.sourceforge.net/download.html
QC3 - https://github.com/slzhao/QC3
Final GATK filtration runs with following parameters:
"AS_QD < 2.0 && AS_FS > 60.0 && AS_MQ < 40.0 && AS_MQRankSum < -12.5 && AS_ReadPosRankSum < -8.0" for SNP's
"AS_QD < 2.0 && AS_FS > 200.0 && AS_ReadPosRankSum < -20.0 for Indels
Files description
Snakefile - executable file for Snakemake. To run, simply type snakemake in terminal in project directory.
/rules - directory with pipeline's rules
01_haplotype_caller.smk - Call variants using HaplotypeCaller in GVCF mode
02_combine_gvcf.smk - Combine GVCF files to one cohort file
03_genotype_gvcf.smk - Genotype cogort GVCF file
04_left_trim.smk - Left-aligns the indels and trims common bases from indels
05_select_snp.smk - Select variants to SNP 
06_select_indel.smk - Select variants to indels
07_filter_snp.smk - Filtering SNP variants
08_filter_indel.smk - Filtering indels variant
09_bcftools_norm_snp.smk' - Prepare SNP imput files to annovar using bcftools
10_bcftools_norm_ind.smk' - Prepare indels imput files to annovar using bcftools
11_annovar_snp.smk' - Annotate SNP variants
12_annovar_ind.smk' - Annotate indels variants
13_snpEff.smk' - Annotate combine gvcf file by snpEff
/snpEff - result from snpEff
/QC3 - result from QC3
```


