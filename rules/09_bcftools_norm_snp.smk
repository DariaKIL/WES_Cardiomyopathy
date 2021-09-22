configfile: work_dir + '/config.yaml'

rule bcftools_norm_snp:
    input: work_dir + '/output/filter_snp_left_trim_combine_genotype.g.vcf.gz'
    output: work_dir + '/output/norm_filter_snp_left_trim_combine_genotype.vcf'
    shell: 'bcftools norm -m-both -o {output} {input}'