configfile: '/home/kilina_da/project-ib/config.yaml'

rule ref_index:
    input: ref
    output: reference_index
    threads: 14
    priority: 1
    shell: 'samtools faidx {input} -o {output}'
