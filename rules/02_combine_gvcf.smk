configfile: work_dir + '/config.yaml'

rule combine_gvcf:
    input: 
        expand(work_dir + '/output/{sample}.g.vcf.gz', sample=samples)
    output: 
        work_dir + '/output/combine.g.vcf.gz'
    params: 
        ref,
        files = lambda wildcards, input: "--variant ".join(input)
    shell: 'gatk CombineGVCFs -R {params.ref} --variant {params.files} -O {output}'