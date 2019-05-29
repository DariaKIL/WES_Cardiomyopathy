configfile: '/home/kilina_da/project-ib/config.yaml'

rule combine_gvcf:
    input: work_dir + '/kilina_da/output/{sample}.g.vcf.gz'
    output: work_dir + '/kilina_da/output/combine.g.vcf.gz'
    params: ref
    threads: 14
    shell: '~/gatk-4.1.2.0/gatk CombineGVCFs -R {params} --variant {input} -O {output}'