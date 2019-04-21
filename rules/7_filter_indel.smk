configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule indel_filter:
    input: work_dir + '/input/{sample}_select.vcf',
    output: work_dir + '/input/{sample}_indels.vcf',
    params: ref
    threads: 4
    shell: 'gatk VariantFiltration -R {params} -V {input} -O {output} --filter-name "indels_filter" --filter-expression "AS_QD < 2.0 && AS_FS > 200.0 &&AS_ReadPosRankSum < -20.0"'
