configfile: 'config.yaml'

import os, sys
#Go to the working directory
os.chdir('/mnt/IMBG-NGS-Analysys/StudentsWork')
print('Current working dir : %s' % os.getcwd())
work_dir = os.getcwd()

#Reference
reference_path = work_dir + '/kilina_da/reference'
reference_name = '/hs37d5'
reference_ext = 'fa'
ref = '{}{}.{}'.format(reference_path, reference_name, reference_ext)

reference_index = reference_path + reference_name + reference_ext + '.fai'
reference_dict = reference_path + reference_name + '.dict'

#For samples
samples, = glob_wildcards(work_dir + '/ExomesData/{sample}.bam')
print('BAM files:' + str(samples))

rule all:
    input:
        #expand(work_dir + '/ExomesData/{sample}.bam.bai', sample=samples),
        #reference_index,
        #reference_dict,
        expand(work_dir + '/kilina_da/output/{sample}.g.vcf.gz', sample=samples),
        work_dir + '/kilina_da/output/combine.g.vcf.gz',
        work_dir + '/kilina_da/output/combine_genotype.g.vcf.gz',
        expand(work_dir + '/kilina_da/output/left_trim_combine_genotype.g.vcf.gz'),
        expand(work_dir + '/kilina_da/output/snp_left_trim_combine_genotype.g.vcf.gz'),
        expand(work_dir + '/kilina_da/output/indel_left_trim_combine_genotype.g.vcf.gz'),
        expand(work_dir + '/kilina_da/output/filter_snp_left_trim_combine_genotype.g.vcf.gz'),
        expand(work_dir + '/kilina_da/output/filter_indel_left_trim_combine_genotype.g.vcf.gz'),
        #work_dir + '/kilina_da/output/filter_snp_combine.g.vcf.gz',
        #work_dir + '/kilina_da/output/filter_indel_combine.g.vcf.gz'
       


##### Modules #####

#include:'/home/kilina_da/project-ib/rules/1_bam_index.smk'
#include:'/home/kilina_da/project-ib/rules/2_ref_index.smk'
#include:'/home/kilina_da/project-ib/rules/3_ref_dict.smk'
#include:'/home/kilina_da/project-ib/rules/5_combine_GVCF.smk'
#include:'/home/kilina_da/project-ib/rules/6_genotype_GVCF.smk'
include:'/home/kilina_da/project-ib/rules/7_left_trim.smk'
include:'/home/kilina_da/project-ib/rules/8_select_snp.smk'
include:'/home/kilina_da/project-ib/rules/9_select_indel.smk'
include:'/home/kilina_da/project-ib/rules/10_filter_snp.smk'
include:'/home/kilina_da/project-ib/rules/11_filter_indel.smk'
#include:'/home/kilina_da/project-ib/rules/12_annovar_snp.smk'
#include:'/home/kilina_da/project-ib/rules/13_annovar_ind.smk'    





