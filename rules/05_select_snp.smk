configfile: '/home/kilina_da/project-ib/config.yaml'

rule select_snp:
    input: 
        work_dir + '/kilina_da/output/left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/kilina_da/output/snp_left_trim_combine_genotype.g.vcf.gz'
    params: 
        ref
    priority: 
        3
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk SelectVariants \
        -R {params} \
        -V {input} \
        -O {output} \
        --select-type-to-include SNP
        """