configfile: '/home/kilina_da/project-ib/config.yaml'

rule combine_gvcf:
    input: 
        expand(work_dir + '/kilina_da/output/{sample}.g.vcf.gz', sample=samples)
    output: 
        work_dir + '/kilina_da/output/combine.g.vcf.gz'
    params: 
        ref,
        files = lambda wildcards, input: "--variant ".join(input)
    shell: '~/gatk-4.1.2.0/gatk CombineGVCFs -R {params.ref} --variant {params.files} -O {output}'