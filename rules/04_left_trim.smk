configfile: work_dir + '/config.yaml'

rule left_trim:
    input: 
        work_dir + '/output/combine_genotype.g.vcf.gz',
    output: 
        work_dir + '/output/left_trim_combine_genotype.g.vcf.gz',
    params: 
        ref,
        interval = config["bed_file"],
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk LeftAlignAndTrimVariants \
        -R {params.ref} \
        -V {input} \
        -O {output} \
        --split-multi-allelics  \
        --intervals {params.interval}
        """