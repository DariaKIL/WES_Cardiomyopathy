configfile: '/home/kilina_da/project-ib/config.yaml'

rule combine_GVCF:
    input: expand(work_dir + '/kilina_da/output/{sample}.g.vcf.gz', sample=samples)
    output: work_dir + '/kilina_da/output/combine.g.vcf.gz'
    params: 
        ref
        files = lambda wildcards, input: " -V ".join(input)
    priority: 2
    threads: 14
    shell: '~/gatk-4.1.2.0/gatk CombineGVCFs -R {params.ref} --variant {params.files} -O {output}'
    ~/gatk-4.1.2.0/gatk CombineGVCFs -R ../reference/hs37d5.fa --variant Ab_A.recal_pass2.g.vcf.gz --variant Ab_s.recal_pass2.g.vcf.gz --variant Kir.recal_pass2.g.vcf.gz --variant Kra.recal_pass2.g.vcf.gz --variant Lop.recal_pass2.g.vcf.gz --variant Lop.recal_pass2.g.vcf.gz --variant S_J.recal_pass2.g.vcf.gz --variant S_M.recal_pass2.g.vcf.gz --variant V_M.recal_pass2.g.vcf.gz --variant V_R.recal_pass2.g.vcf.gz --variant Sgi.recal_pass2.g.vcf.gz -O combine.g.vcf.gz

