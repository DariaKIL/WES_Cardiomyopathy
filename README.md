# Pipeline for variant calling by HaplotypeCaller (GATK)
--------------------------------------------------------

## Description
--------------------------------------------------------

Laboratory of Molecular Biology and Genetics of Federal Almazov Medical Research Center regularly performs exom sequencing in patients. As a rule, prior to whole exom sequencing (WES), the analysis of the hereditary nature of the disease is carried out and these patients are sequenced on small panels with targeted enrichment of the genes described in the literature and known as causal in different type of cardiomyopathy. If the small panel does not produce results, then WES can be conduct and the analysis of rare variants using frequency databases allows identifying pathogenic variants in ~ 70% of such patients.

## Goal
---------------------------------------------------------

Detecting previously unknown variants of SNP and indels in patients with different types of idiopathic cardiomyopathies.

## Objectives
---------------------------------------------------------

* Write Pipeline for Variant Calling and Variant Filtration
* Analyze data with HaplotypeCaller
* Annotate with Annovar, SnpEff.
* All stages are included in the Snakemake pipeline, presented in this repository.

## Material
---------------------------------------------------------
* 10 different WES samples  from patients with idiopathic cases of caridiomyopathy
* Feference version is ```hs37d5```
```
ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz
```

## Methods
----------------------------------------------------------

- samtools - ```sudo apt install samtools```
- bcftools - ```sudo apt install bcftools```
- GATK-4.1.2.0 - ```https://software.broadinstitute.org/gatk/download/```
- annovar - ```http://download.openbioinformatics.org/annovar_download_form.php```
- SNPEff - ```snpeff.sourceforge.net/download.html```
- Final GATK filtration runs with following parameters:
``` "AS_QD < 2.0 && AS_FS > 60.0 && AS_MQ < 40.0 && AS_MQRankSum < -12.5 && AS_ReadPosRankSum < -8.0" ``` for SNP's
``` "AS_QD < 2.0 && AS_FS > 200.0 && AS_ReadPosRankSum < -20.0 ``` for Indels
- QC3 - ```https://github.com/slzhao/QC3```
QC3 was ran inside pipeline with following command 
```perl qc3.pl -m v -i ./combine_genotype.g.vcf -o ../QC3```


## Files description
----------------------------------------------------------

##### Snakefile 
- executable file for Snakemake. To run, simply type snakemake in terminal in project directory
##### Comfig.yaml 
- - configuration file for Snakemake
##### /snpEff 
- result from snpEff
##### /QC3 
- result from QC3
##### /rules - directory with pipeline's rules
- 00_bam_index.smk - Indexing bam file's  
- 01_haplotype_caller.smk - Calling variants using HaplotypeCaller in GVCF mode
- 02_combine_gvcf.smk - Combining GVCF files to one cohort file
- 03_genotype_gvcf.smk - Genotyping cogort GVCF file
- 04_left_trim.smk - Left-aligning the indels and triming common bases from indels
- 05_select_snp.smk - Selecting variants to SNP 
- 06_select_indel.smk - Selecting variants to indels
- 07_filter_snp.smk - Filtering SNP variants
- 08_filter_indel.smk - Filtering indels variant
- 09_bcftools_norm_snp.smk - Preparing SNP imput files to annovar using bcftools
- 10_bcftools_norm_ind.smk - Preparing indels imput files to annovar using bcftools
- 11_annovar_snp.smk - Annotate SNP variants
- 12_annovar_ind.smk - Annotate indels variants
- 13_snpEff.smk - Annotate combine gvcf file by snpEff

## System requirements
----------------------------------------------------------
- python 3
- perl 5
- java 8 (openjdk version "1.8.0_191")




