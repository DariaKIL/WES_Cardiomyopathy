configfile: work_dir + '/config.yaml'

rule indel_filter:
    input: 
        work_dir + '/output/indel_left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/output/filter_indel_left_trim_combine_genotype.g.vcf.gz'
    params: 
        ref
    threads:
        14
    shell:
        r"""
        gatk VariantFiltration \
        -R {params} \
        -V {input} \
        -O {output} \
        --filter-name "indels_filter" \
        --filter-expression "AS_QD < 2.0 && AS_FS > 200.0 &&AS_ReadPosRankSum < -20.0"
        """
