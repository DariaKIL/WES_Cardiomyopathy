# Detection of pathogenic INDELs and  SNPs in whole-exome sequencing data of patients with different types of idiopathic cardiomyopathy
Pipeline for variant calling by HaplotypeCaller (GATK)
--------------------------------------------------------

### Was tested only on Linux

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

## Materials
---------------------------------------------------------
* 10 different WES samples  from patients with idiopathic cases of caridiomyopathy
* Feference version is [hs37d5](ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz)
* [Bed file](https://drive.google.com/file/d/1mu6VE1f7yfY2cUCZ1TwQzXpaF_8lX7qk/view?usp=sharing)


## How to use

- Create `ExomesData` folder 
- Put your `bam` files there

---------------------------------------------------------

## Programms
----------------------------------------------------------

- Samtools - ```sudo apt install samtools```
- Bcftools - ```sudo apt install bcftools```
- Snakemake - ```pip3 install snakemake```
- Picard - ```sudo apt install picard-tools```
- [GATK-4.1.2.0](https://software.broadinstitute.org/gatk/download/)
- [Annovar](http://download.openbioinformatics.org/annovar_download_form.php)
- [SNPEff](snpeff.sourceforge.net/download.html)
- [QC3](https://github.com/slzhao/QC3) 
- [R-studio](https://www.r-studio.com/ru/)
- Final GATK filtration run with following parameters:
``` "AS_QD < 2.0 && AS_FS > 60.0 && AS_MQ < 40.0 && AS_MQRankSum < -12.5 && AS_ReadPosRankSum < -8.0" ``` for SNP's
``` "AS_QD < 2.0 && AS_FS > 200.0 && AS_ReadPosRankSum < -20.0 ``` for Indels

## Files description
----------------------------------------------------------

##### Snakefile 
- executable file for Snakemake
##### Comfig.yaml 
- configuration file for Snakemake
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
##### SNP_result.csv
- SNP after manual filtration in R 

## System requirements
----------------------------------------------------------
- python 3
- perl 5
- java 8 (openjdk version "1.8.0_191")
- R-3.6.0

## Commands description
----------------------------------------------------------
We can't provide our imput data and vcf files with annotated results, because this is confidential information about patients. 

The first Variant Calling steps were provided in Snakemake pipeline. This is the workflow recommended in our Best Practices for performing variant discovery analysis on cohorts of samples. We call variants individually on each sample using the HaplotypeCaller in -ERC GVCF mode. In a second step, we then perform a joint genotyping analysis of the gVCFs produced for all samples in a cohort. Then we run GenotypeGVCFs on all of them together to create the raw SNP and indel VCFs. Then we go to filtering variants to SNP and INDELS and annotation by Annovar and SnpEff.

To run, we need simply type snakemake in terminal in project directory.
The main output from this pipeline is annotated vcf file from annovar. 

QC3 was ran inside pipeline with following command 
```perl qc3.pl -m v -i ./combine_genotype.g.vcf -o path/to/QC3```

Then we need to extract some information from vcf file with ```bcftools query``` and make simple txt table.

```
bcftools query -f '%CHROM %POS %ID %REF %ALT %QUAL %FILTER %FORMAT %AF %ExAC_ALL %CADD_phred %Func.refGene %Gene.refGene %ExonicFunc.refGene %AAChange.refGene %ExAC_ALL %SIFT_pred %Polyphen2_HDIV_pred %Polyphen2_HVAR_pred %LRT_pred %MutationTaster_pred %MutationAssessor_pred %FATHMM_pred %PROVEAN_pred %CADD_phred %MetaSVM_pred\n' snp_myanno.hg19_multianno.vcf > snp_myanno_bases.txt
```
The simple filtration with small R command
```
snp_data <-  read.csv('snp_myanno_bases.txt', sep=' ', na.strings = '.')
snp_data1 <- subset(snp_data, AF > ExAC_ALL &
                    ID == NA &
                    Func == 'exonic' & 
                    CADD_phred > 20 &
                    SIFT_pred == 'D' &
                    Polyphen2_HDIV_pred == 'D' &
                    Polyphen2_HVAR_pred == 'D' &
                    LRT_pred == 'D' &
                    FATHMM_pred == 'D' &
                    PROVEAN_pred == 'D' &
                    MetaSVM_pred == 'D' &
                    MutationTaster_pred == 'D' &
                    MutationAssessor_pred == 'H')
write.csv(snp_data1, "SNP_result.csv")
```
There is just SNPs result, because the similar manipulation for INDELs (but not the same, because not all tool prediction work with indels) did't lead the result - all damaging INDELs had allready known.

#### Some information about gene with one of SNPs - SLC2A8 (Solute Carrier Family 2 Member 8)
This gene belongs to the solute carrier 2A family, which includes intracellular glucose transporters and expression of glucose transporters. The loss of metabolic flexibility associated with increased reliance on glucose utilization contribute to the development of cardiac dysfunction. The changes in glucose metabolism in hypertrophied hearts include altered glucose transport and increased glycolysis  *Shao, D., & Tian, R. (2015). Glucose Transporters in Cardiac Metabolism and Hypertrophy. Comprehensive Physiology, 331–351. doi:10.1002/cphy.c150016*

----------------------------------------------------------

## Results
----------------------------------------------------------
1. Variant Calling (GATK) pipeline on Snakemake was implemented 
2. The main statistics from snpEff - 48.07% missens and 51.38% silence, the total number of SNPs - 203.827, INS - 14.352, DEL -19.891
3. As a result of comparing the allele frequencies with the frequencies of ExAC and taking into account the tool prediction (SIFT, Polyphen2, LRT, MutationTaster, MutationAssessor, FATHMM, PROVEAN, CADD, MetaSVM) 6 previously unknown SNPs in various genes were detected. The most interesting is the mutation in the SLC25A5 gene, according to the literature data.
4. New INDELs variants haven't been identified

