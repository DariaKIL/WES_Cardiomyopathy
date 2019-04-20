configfile: "config.yaml"

import os

work_dir = os.getcwd() + '/'

rule all:
    input:
        "home/daria/Documents/Project2/SoCHR22_hg19.bam.bai",
        "hs37d5.fa.fai",
        "home/daria/Documents/Project2/s37d5.dict",
        "home/daria/Documents/Project2/SoCHR22_hg19.vcf",
        "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf",
        "home/daria/Documents/Project2/SoCHR22_hg19_indels.vcf"

##### Modules #####

include:"rules/1_bam_index.smk"
include:"rules/2_ref_index.smk"
include:"rules/3_ref_dict.smk"
include:"rules/4_HC.smk"
include:"rules/5_select_snp.smk"
include:"rules/6_snp_filter.smk"
#include:"rules/7_filter_indel.smk"
#include:"rules/8_select_indel.smk"                                                                              
