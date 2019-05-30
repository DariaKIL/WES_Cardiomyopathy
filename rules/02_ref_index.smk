configfile: '/home/kilina_da/project-ib/config.yaml'

rule ref_index:
    input: ref
    output: reference_index
    shell: 'samtools faidx {input} -o {output}'
