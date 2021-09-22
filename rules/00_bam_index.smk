configfile: work_dir + '/config.yaml'

rule bam_index:
    input: work_dir + '/ExomesData/{sample}.bam',
    output: work_dir + '/ExomesData/{sample}.bam.bai'
    shell: 'samtools index {input}'
