configfile: '/home/kilina_da/project-ib/config.yaml'

rule bcftools_norm_snp:
    input: work_dir + '/kilina_da/output/filter_snp_left_trim_combine_genotype.g.vcf.gz'
    output: work_dir + '/kilina_da/output/norm_filter_snp_left_trim_combine_genotype.vcf'
    shell: 'bcftools norm -m-both -o {output} {input}'