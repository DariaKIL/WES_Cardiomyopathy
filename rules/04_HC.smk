configfile: '/home/kilina_da/project-ib/config.yaml'

rule HC:
    input: 
        work_dir + '/kilina_da/input/{sample}.bam',
    output: 
        work_dir + '/kilina_da/output/{sample}.g.vcf.gz',
    params: 
        ref
    priority: 
        2
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk HaplotypeCaller \
        -I {input} \
        -R {params} \
        -O {output} \
        --native-pair-hmm-threads {threads} \
        -ERC GVCF
        """
