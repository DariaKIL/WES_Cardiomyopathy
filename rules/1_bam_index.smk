configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule bam_index:
    input: work_dir + '/input/{sample}.bam',
    output: work_dir + '/input/{sample}.bam.bai'
    threads: 4
    shell: 'samtools index {input}'
