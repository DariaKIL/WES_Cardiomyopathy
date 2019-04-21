configfile: 'config.yaml'

import os, sys
#Go to the working directory
os.chdir('/home/daria/Documents/Project2')
print('Current working dir : %s' % os.getcwd())
work_dir = os.getcwd()

#Reference
reference_path = work_dir + '/reference'
reference_name = '/hs37d5'
reference_file_extension = 'fa'
ref = '{}{}.{}'.format(reference_path, reference_name, reference_file_extension)

reference_index = reference_path + reference_name + '.fai'
reference_dict = reference_path + reference_name + '.dict'

#For samples
samples, = glob_wildcards(work_dir + "/input/{sample}.bam")
print('BAM files:' + str(samples))

rule all:
    input:
        expand(work_dir + '/input/{sample}.bam.bai', sample=samples),
        reference_index,
        reference_dict,
        expand(work_dir + '/input/{sample}.vcf', sample=samples),
        expand(work_dir + '/input/{sample}_select.vcf', sample=samples),
        expand(work_dir + '/input/{sample}_snps.vcf', sample=samples),
        expand(work_dir + '/input/{sample}_indels.vcf', sample=samples)


##### Modules #####

include:'/home/daria/snakemake/project-ib/rules/1_bam_index.smk'
include:'/home/daria/snakemake/project-ib/rules/2_ref_index.smk'
include:'/home/daria/snakemake/project-ib/rules/3_ref_dict.smk'
include:'/home/daria/snakemake/project-ib/rules/4_HC.smk'
include:'/home/daria/snakemake/project-ib/rules/5_select_var.smk'
include:'/home/daria/snakemake/project-ib/rules/6_snp_filter.smk'
include:'/home/daria/snakemake/project-ib/rules/7_filter_indel.smk'                                                                            
