configfile: '/home/kilina_da/project-ib/config.yaml'

rule bam_index:
    input: work_dir + '/input/{sample}.bam',
    output: work_dir + '/input/{sample}.bam.bai'
    priority: 1
    threads: 14
    shell: 'samtools index {input}'
