configfile: '/home/kilina_da/project-ib/config.yaml'

rule left_trim:
    input: 
        work_dir + '/kilina_da/output/combine_genotype.g.vcf.gz',
    output: 
        work_dir + '/kilina_da/output/left_trim_combine_genotype.g.vcf.gz',
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