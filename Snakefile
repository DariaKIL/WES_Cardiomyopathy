configfile: 'config.yaml'

import os, sys
#Go to the working directory
os.chdir('/home/daria/Documents/Project2')
print('Current working dir : %s' % os.getcwd())
work_dir = os.getcwd()

#Reference
reference_path = work_dir + '/reference'
reference_name = 'hs37d5'
reference_file_extension = 'fa'
ref = '{}{}.{}'.format(reference_path, reference_name, reference_file_extension)

reference_index = reference_path + reference_name + '.fai'
reference_dict = reference_path + reference_name + '.dict'

#for samples
samples, = glob_wildcards(config["bam_file"]+"{sample}.bam")
print('BAM files:' + str(samples))

rule all:
    input:
        expand('input/{sample}.bam', sample=samples),
        expand('input/{sample}.bam.bai', sample=samples),
#        "home/daria/Documents/Progect2/hs37d5.fa.fai",
#        "home/daria/Documents/Project2/hs37d5.dict",
#        expand("home/daria/Documents/Project2/{sample}.vcf"),
#        expand("home/daria/Documents/Project2/{sample}_snps.vcf"),
#        expand("home/daria/Documents/Project2/{sample}_indels.vcf")

##### Modules #####

include:'/home/daria/snakemake/project-ib/rules/1_bam_index.smk'
#include:"rules/2_ref_index.smk"
#include:"rules/3_ref_dict.smk"
#include:"rules/4_HC.smk"
#include:"rules/5_select_snp.smk"
#include:"rules/6_snp_filter.smk"
#include:"rules/7_filter_indel.smk"
#include:"rules/8_select_indel.smk"                                                                              
