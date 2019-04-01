include: "rules/common.smk"
configfile: "config.yaml"

#import python library
import os

#path to dir
work_dir = os.getcwd() + '/'
bam_file = work_dir + "bam_file"
ref = work_dir + "genome"

rule all:
    input:
        "/home/daria/Documents/Project2/SoCHR22_hg19.bam"
        "/home/daria/Documents/Project2/GRCh37.primary_assembly.genome.fa"


##### Modules #####

include: "rules/rule_bam_index.smk"
include: "rules/rule_ref_index.smk"
include: "rules/rule_HC.smk"
include: "rules/rule_select_snp.smk"
include: "rules/rule_snp_filter.smk"
include: "rules/rule_filter_indel.smk"
include: "rules/rule_select_indel.smk"