configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule ref_index:
    input: ref
    output: reference_index
    threads: 4
    priority: 1
    shell: 'samtools faidx {input} -o {output}'
