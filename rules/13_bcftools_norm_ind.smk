configfile: '/home/kilina_da/project-ib/config.yaml'

rule bcftools_norm_ind:
    input: work_dir + '/kilina_da/output/filter_indel_left_trim_combine_genotype.g.vcf.gz'
    output: work_dir + '/kilina_da/output/norm_filter_indel_left_trim_combine_genotype.vcf'
    shell: 'bcftools norm -m-both -o {output} {input}'