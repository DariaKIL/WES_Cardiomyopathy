configfile: '/home/kilina_da/project-ib/config.yaml'

rule genotype_GVCF:
    input: work_dir + '/kilina_da/output/cohort.g.vcf.gz'
    output: work_dir + '/kilina_da/output/cohort_genotyped.g.vcf.gz'
    params: ref
    priority: 2
    threads: 14
    shell: '~/gatk-4.1.2.0/gatk --java-options "-Xmx4g" GenotypeGVCFs -R {ref} -V {input} -O {output} -dbsnp config[dbsnp]'
    # ~/gatk-4.1.2.0/gatk --java-options "-Xmx4g" GenotypeGVCFs -R ../reference/hs37d5.fa -V S_M.recal_pass2.g.vcf.gz -O S_M.recal_pass2_genotype.g.vcf.gz -dbsnp ../reference/'