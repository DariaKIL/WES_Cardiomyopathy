configfile: "config.yaml"

import os

work_dir = os.getcwd() + '/'

#for samples
samples, = glob_wildcards(config["bam_file"]+"/{sample}.bam")

rule all:
    input:
        expand("home/daria/Documents/Project2/{sample}.bam.bai"),
        "home/daria/Documents/Progect2/hs37d5.fa.fai",
        "home/daria/Documents/Project2/hs37d5.dict",
        expand("home/daria/Documents/Project2/{sample}.vcf"),
        expand("home/daria/Documents/Project2/{sample}_snps.vcf"),
        expand("home/daria/Documents/Project2/{sample}_indels.vcf")

##### Modules #####

include:"rules/1_bam_index.smk"
include:"rules/2_ref_index.smk"
include:"rules/3_ref_dict.smk"
include:"rules/4_HC.smk"
include:"rules/5_select_snp.smk"
include:"rules/6_snp_filter.smk"
#include:"rules/7_filter_indel.smk"
#include:"rules/8_select_indel.smk"                                                                              
