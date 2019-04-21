configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule ref_dict:
    input: ref
    output: reference_dict
    threads: 4
    shell: 'gatk CreateSequenceDictionary -R {input} -O {output}'
