configfile: "config.yaml"


import os

work_dir = os.getcwd() + '/'

rule all:
    input:
        "/home/daria/Documents/Project2/SoCHR22_hg19.bam"
        "/home/daria/Documents/Project2/GRCh37.primary_assembly.genome.fa"


##### Modules #####

include: work_dir + "rules/rule_bam_index.smk"
include: work_dir + "rules/rule_ref_index.smk"
include: work_dir + "rules/rule_HC.smk"
include: work_dir + "rules/rule_select_snp.smk"
include: work_dir + "rules/rule_snp_filter.smk"
include: work_dir + "rules/rule_filter_indel.smk"
include: work_dir + "rules/rule_select_indel.smk"
~                                                                                                                                             
~                                                                                                                                             
~                                                                                                                                             
~                                                        