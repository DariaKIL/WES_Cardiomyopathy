configfile: '/home/kilina_da/project-ib/config.yaml'

rule indel_filter:
    input: 
        work_dir + '/kilina_da/output/indel_left_trim_combine_genotype.g.vcf.gz'
    output: 
        work_dir + '/kilina_da/output/filter_indel_left_trim_combine_genotype.g.vcf.gz'
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
        --filter-name "indels_filter" \
        --filter-expression "AS_QD < 2.0 && AS_FS > 200.0 &&AS_ReadPosRankSum < -20.0"
        """
