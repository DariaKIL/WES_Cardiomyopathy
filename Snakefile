configfile: "config.yaml"


import os

work_dir = os.getcwd() + '/'


rule all:
    input:
        expand("home/daria/Documents/Project2/SoCHR22_hg19.bam.bai"),
        expand("home/daria/Project2/GRCh37.primary_assembly.genome.fa.fai"),
        expand("home/daria/Documents/Project2/SoCHR22_hg19.vcf"),
        expand("home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf" ),
        expand("home/daria/Documents/Project2/SoCHR22_hg19_indels.vcf"),


##### Modules #####

include: "rules/rule_bam_index.smk"
include: "rules/rule_ref_index.smk"
include: "rules/rule_HC.smk"
include: "rules/rule_select_snp.smk"
include: "rules/rule_snp_filter.smk"
include: "rules/rule_filter_indel.smk"
include: "rules/rule_select_indel.smk"                                                                              
