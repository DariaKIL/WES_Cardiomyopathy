configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule select_var:
    input: work_dir + '/input/{sample}.vcf',
    output: work_dir + '/input/{sample}_select.vcf',
    params: ref
    priority: 3
    threads: 4
    shell: 'gatk SelectVariants -R {params} -V {input} -О {output}'




