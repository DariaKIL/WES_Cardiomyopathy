configfile: '/home/kilina_da/project-ib/config.yaml'

rule genotype_gvcf:
    input: 
        work_dir + '/kilina_da/output/cohort.g.vcf.gz'
    output: 
        work_dir + '/kilina_da/output/cohort_genotyped.g.vcf.gz'
    params: 
        ref
    threads: 
        14
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk --java-options "-Xmx4g" GenotypeGVCFs \
        -R {ref} \
        -V {input} \
        -O {output} \
        -dbsnp config[dbsnp] \
        -intervals config[bed_file]
        """
