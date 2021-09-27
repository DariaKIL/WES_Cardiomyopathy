configfile: work_dir + '/config.yaml'

rule fa_index:
    input: ref,
    output: ref + '.fai'
    shell: 'samtools faidx {input}'
