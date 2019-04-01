include: "rules/common.smk"
configfile: "config.yaml"

rule all:
    input:
        "/Project2/SoCHR22_hg19.bam",
        "/Project2/GRCh37.primary_assembly.genome.fa"


##### Modules #####

include: "rules/rule bam_index.smk"
include: "rules/rule ref_index.smk"
include: "rules/rule HC.smk"
include: "rules/rule select_snp.smk"
include: "rules/rule snp_filter.smk"
include: "rules/rule filter_indel.smk"
include: "rules/rule select_indel.smk"