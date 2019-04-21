configfile: '/home/daria/snakemake/project-ib/config.yaml'

rule snp_filter:
    input: work_dir + '/input/{sample}_select.vcf'
    output: work_dir + '/input/{sample}_snps.vcf'
    params: ref
    threads: 4
    shell: 'gatk VariantFiltration -R {params} -V {input} -O {output} --filter-name "snp_filter" --filter-expression "AS_QD < 2.0 && AS_FS > 60.0 && AS_MQ < 40.0 && AS_MQRankSum < -12.5 && AS_ReadPosRankSum < -8.0"'
