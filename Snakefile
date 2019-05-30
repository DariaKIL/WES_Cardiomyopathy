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

#For samples
samples, = glob_wildcards(work_dir + '/ExomesData/{sample}.bam')
print('BAM files:' + str(samples))

rule all:
    input:
        expand(work_dir + '/kilina_da/output/{sample}.g.vcf.gz', sample=samples),
        work_dir + '/kilina_da/output/combine.g.vcf.gz',
        work_dir + '/kilina_da/output/combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/snp_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/indel_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/filter_snp_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/filter_indel_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/kilina_da/output/norm_filter_snp_left_trim_combine_genotype.vcf',
        work_dir + '/kilina_da/output/norm_filter_indel_left_trim_combine_genotype.vcf',
        work_dir + '/kilina_da/output/snp_myanno.hg19_multianno.vcf',
        work_dir + '/kilina_da/output/indel_myanno.hg19_multianno.vcf',
        work_dir + '/kilina_da/output/combine_genotype_snpEff.vcf',

       


##### Modules #####

include:'/home/kilina_da/project-ib/rules/01_haplotype_caller.smk'
include:'/home/kilina_da/project-ib/rules/02_combine_gvcf.smk'
include:'/home/kilina_da/project-ib/rules/03_genotype_gvcf.smk'
include:'/home/kilina_da/project-ib/rules/04_left_trim.smk'
include:'/home/kilina_da/project-ib/rules/05_select_snp.smk'
include:'/home/kilina_da/project-ib/rules/06_select_indel.smk'
include:'/home/kilina_da/project-ib/rules/07_filter_snp.smk'
include:'/home/kilina_da/project-ib/rules/08_filter_indel.smk'
include:'/home/kilina_da/project-ib/rules/09_bcftools_norm_snp.smk'
include:'/home/kilina_da/project-ib/rules/10_bcftools_norm_ind.smk'
include:'/home/kilina_da/project-ib/rules/11_annovar_snp.smk'
include:'/home/kilina_da/project-ib/rules/12_annovar_ind.smk'
include:'/home/kilina_da/project-ib/rules/13_snpEff.smk'    








