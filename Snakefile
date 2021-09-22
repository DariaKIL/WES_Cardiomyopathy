configfile: 'config.yaml'

import os, sys

import pathlib

#Go to the working directory
# os.chdir('/mnt/IMBG-NGS-Analysys/StudentsWork')
# print('Current working dir : %s' % os.getcwd())


# work_dir = pathlib.Path(__file__).parent.resolve()
work_dir = os.getcwd()
print("work_dir: ", work_dir)
# work_dir = os.path.join(os.getcwd(), "data")

#Reference
reference_path = work_dir + '/reference'
reference_name = '/hs37d5'
reference_ext = 'fa'
ref = '{}{}.{}'.format(reference_path, reference_name, reference_ext)

#For samples
samples, = glob_wildcards(work_dir + '/ExomesData/{sample}.bam')
print('BAM files:' + str(samples))

rule all:
    input:
        expand(work_dir + '/ExomesData/{sample}.bam.bai', sample=samples),
        expand(work_dir + '/output/{sample}.g.vcf.gz', sample=samples),
        work_dir + '/output/combine.g.vcf.gz',
        work_dir + '/output/combine_genotype.g.vcf.gz',
        work_dir + '/output/left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/output/snp_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/output/indel_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/output/filter_snp_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/output/filter_indel_left_trim_combine_genotype.g.vcf.gz',
        work_dir + '/output/norm_filter_snp_left_trim_combine_genotype.vcf',
        work_dir + '/output/norm_filter_indel_left_trim_combine_genotype.vcf',
        work_dir + '/output/snp_myanno.hg19_multianno.vcf',
        work_dir + '/output/indel_myanno.hg19_multianno.vcf',
        work_dir + '/output/combine_genotype_snpEff.vcf',

       


##### Modules #####
include: work_dir + '/rules/00_bam_index.smk'
include: work_dir + '/rules/01_haplotype_caller.smk'
include: work_dir + '/rules/02_combine_gvcf.smk'
include: work_dir + '/rules/03_genotype_gvcf.smk'
include: work_dir + '/rules/04_left_trim.smk'
include: work_dir + '/rules/05_select_snp.smk'
include: work_dir + '/rules/06_select_indel.smk'
include: work_dir + '/rules/07_filter_snp.smk'
include: work_dir + '/rules/08_filter_indel.smk'
include: work_dir + '/rules/09_bcftools_norm_snp.smk'
include: work_dir + '/rules/10_bcftools_norm_ind.smk'
include: work_dir + '/rules/11_annovar_snp.smk'
include: work_dir + '/rules/12_annovar_ind.smk'
include: work_dir + '/rules/13_snpEff.smk'

