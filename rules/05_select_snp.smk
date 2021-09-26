configfile: work_dir + '/config.yaml'

rule select_snp:
    input: 
        work_dir + '/output/left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/output/snp_left_trim_combine_genotype.g.vcf.gz'
    params: 
        ref
    priority: 
        3
    threads: 
        14
    shell: 
        r"""
        gatk SelectVariants \
        -R {params} \
        -V {input} \
        -O {output} \
        --select-type-to-include SNP
        """