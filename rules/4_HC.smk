configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule HC:
    input: work_dir + '/input/{sample}.bam',
    output: work_dir + '/input/{sample}.vcf',
    params: ref
    threads: 4
    shell: 'gatk HaplotypeCaller -I {input} -R {params} -O {output}'
