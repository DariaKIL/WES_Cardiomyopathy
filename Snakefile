include: "rules/common.smk"
configfile: "config.yaml"

rule all:
    input:
        expand("/home/daria/Documents/Project2/SoCHR22_hg19.bam")
        expand("/home/daria/Documents/Project2/GRCh37.primary_assembly.genome.fa")


##### Modules #####

include: "rules/rule_bam_index.smk"
include: "rules/rule_ref_index.smk"
include: "rules/rule_HC.smk"
include: "rules/rule_select_snp.smk"
include: "rules/rule_snp_filter.smk"
include: "rules/rule_filter_indel.smk"
include: "rules/rule_select_indel.smk"