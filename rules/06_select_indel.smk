configfile: work_dir + '/config.yaml'

rule select_indel:
    input: 
        work_dir + '/output/left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/output/indel_left_trim_combine_genotype.g.vcf.gz'
    params: 
        ref
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk SelectVariants \
        -R {params} \
        -V {input} \
        -O {output} \
        --select-type-to-include INDEL
        """