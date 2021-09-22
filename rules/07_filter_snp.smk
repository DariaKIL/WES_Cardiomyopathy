configfile: work_dir + '/config.yaml'

rule snp_filter:
    input: 
        work_dir + '/output/indel_left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/output/filter_snp_left_trim_combine_genotype.g.vcf.gz'
    params: 
        ref
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk VariantFiltration \
        -R {params} \
        -V {input} \
        -O {output} \
        --filter-name "snp_filter" \
        --filter-expression "AS_QD < 2.0 && AS_FS > 60.0 && AS_MQ < 40.0 && AS_MQRankSum < -12.5 && AS_ReadPosRankSum < -8.0"
        """
