configfile: work_dir + '/config.yaml'

rule genotype_gvcf:
    input: 
        work_dir + '/output/combine.g.vcf.gz'
    output: 
        work_dir + '/output/combine_genotype.g.vcf.gz'
    params: 
        ref
    shell: 
        r"""
        ~/gatk-4.1.2.0/gatk --java-options "-Xmx4g" GenotypeGVCFs \
        -R {ref} \
        -V {input} \
        -O {output} \
        -dbsnp config[dbsnp] \
        -intervals config[bed_file]
        """
